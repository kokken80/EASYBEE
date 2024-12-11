package easybee2;

import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.BorderFactory;
import javax.swing.Box;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.SwingUtilities;

public class ModifierMotDePasse extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPasswordField ancienMotDePasseField;
    private JPasswordField nouveauMotDePasseField;
    private JPasswordField confirmationMotDePasseField;
    private JButton btnValider;

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new ModifierMotDePasse().setVisible(true));
    }

    public ModifierMotDePasse() {
        setSize(350, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setResizable(false);
        
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));
        mainPanel.setBackground(Color.WHITE);

        ancienMotDePasseField = createPasswordField("Ancien mot de passe", mainPanel);
        nouveauMotDePasseField = createPasswordField("Nouveau mot de passe", mainPanel);
        confirmationMotDePasseField = createPasswordField("Confirmer le mot de passe", mainPanel);

        JPanel buttonPanel = new JPanel();
        buttonPanel.setBackground(Color.WHITE);
        btnValider = new JButton("Valider");
        btnValider.setBackground(new Color(0, 123, 255));
        btnValider.setForeground(Color.WHITE);
        btnValider.setFocusPainted(false);
        btnValider.setFont(new Font("Arial", Font.BOLD, 14));
        btnValider.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnValider.setPreferredSize(new Dimension(100, 30));
        btnValider.addActionListener(e -> changerMotDePasse());
        buttonPanel.add(btnValider); 

        mainPanel.add(Box.createRigidArea(new Dimension(0, 15))); 
        mainPanel.add(buttonPanel); 

        add(mainPanel);
    }

    private JPasswordField createPasswordField(String placeholder, JPanel parent) {
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setBackground(Color.WHITE);

        JLabel label = new JLabel(placeholder);
        label.setFont(new Font("Arial", Font.PLAIN, 12));
        label.setForeground(new Color(102, 102, 102));

        JPasswordField passwordField = new JPasswordField();
        passwordField.setFont(new Font("Arial", Font.PLAIN, 14));
        passwordField.setBorder(BorderFactory.createLineBorder(new Color(200, 200, 200)));
        passwordField.setPreferredSize(new Dimension(250, 30));

        panel.add(label);
        panel.add(Box.createRigidArea(new Dimension(0, 5))); 
        panel.add(passwordField);
        parent.add(panel);
        parent.add(Box.createRigidArea(new Dimension(0, 10))); 
        return passwordField;
    }

    private void changerMotDePasse() {
        String ancienMotDePasse = new String(ancienMotDePasseField.getPassword());
        String nouveauMotDePasse = new String(nouveauMotDePasseField.getPassword());
        String confirmationMotDePasse = new String(confirmationMotDePasseField.getPassword());

        if (!nouveauMotDePasse.equals(confirmationMotDePasse)) {
            JOptionPane.showMessageDialog(this, "Les mots de passe ne correspondent pas.");
            return;
        }

        String identifiantUtilisateur = SeConnecter.identifiantUtilisateurConnecte;

        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            try {
                String query = "SELECT motDePasse FROM Salarie WHERE identifiant = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, identifiantUtilisateur);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String motDePasseActuel = rs.getString("motDePasse");
                    if (motDePasseActuel.equals(ancienMotDePasse)) {
                        String updateQuery = "UPDATE Salarie SET motDePasse = ? WHERE identifiant = ?";
                        PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                        updateStmt.setString(1, nouveauMotDePasse);
                        updateStmt.setString(2, identifiantUtilisateur);
                        updateStmt.executeUpdate();
                        updateStmt.close();

                        JOptionPane.showMessageDialog(this, "Mot de passe mis à jour avec succès.");
                        dispose();
                        new SeConnecter().setVisible(true);
                    } else {
                        JOptionPane.showMessageDialog(this, "L'ancien mot de passe est incorrect.");
                    }
                }
                stmt.close();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(this, "Erreur de mise à jour du mot de passe.");
            }
        } else {
            JOptionPane.showMessageDialog(this, "Erreur de connexion à la base de données.");
        }
    }
}
