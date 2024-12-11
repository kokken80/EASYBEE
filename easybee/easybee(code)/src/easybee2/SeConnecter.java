package easybee2;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SeConnecter extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    private JTextField identifiantField;  
    private JPasswordField passwordField;
    
    public static String identifiantUtilisateurConnecte;


    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    SeConnecter frame = new SeConnecter();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public SeConnecter() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 400, 300);
        contentPane = new JPanel();
        contentPane.setBackground(Color.WHITE);
        setContentPane(contentPane);
        contentPane.setLayout(null);

        JLabel lblTitle = new JLabel("Se connecter");
        lblTitle.setFont(new Font("Arial", Font.BOLD, 16));
        lblTitle.setBounds(140, 30, 120, 20);
        contentPane.add(lblTitle);

        JLabel lblIdentifiant = new JLabel("Identifiant");
        lblIdentifiant.setFont(new Font("Arial", Font.PLAIN, 12));
        lblIdentifiant.setBounds(50, 80, 80, 20);
        contentPane.add(lblIdentifiant);

        identifiantField = new JTextField();  
        identifiantField.setFont(new Font("Arial", Font.PLAIN, 12));
        identifiantField.setBounds(150, 80, 200, 20);
        contentPane.add(identifiantField);
        identifiantField.setColumns(10);

        JLabel lblPassword = new JLabel("Mot de passe");
        lblPassword.setFont(new Font("Arial", Font.PLAIN, 12));
        lblPassword.setBounds(50, 120, 80, 20);
        contentPane.add(lblPassword);

        passwordField = new JPasswordField();
        passwordField.setFont(new Font("Arial", Font.PLAIN, 12));
        passwordField.setBounds(150, 120, 200, 20);
        contentPane.add(passwordField);

        JButton btnLogin = new JButton("Se connecter");
        btnLogin.setBackground(Color.WHITE);
        btnLogin.setFont(new Font("Arial", Font.PLAIN, 12));
        btnLogin.setBounds(150, 160, 120, 25);
        btnLogin.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                authenticateUser();
            }
        });
        contentPane.add(btnLogin);
    }

    private void authenticateUser() {
        String identifiant = identifiantField.getText();  
        String password = new String(passwordField.getPassword()); 

        if (identifiant.isEmpty() || password.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Veuillez remplir tous les champs.", "Erreur", JOptionPane.ERROR_MESSAGE);
            return;
        }

        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            try {
                
                String query = "SELECT salarie.id, salarie.identifiant, salarie.motDePasse, typesalarie.id AS typeId "
                             + "FROM salarie "
                             + "JOIN typesalarie ON salarie.idType = typesalarie.id "
                             + "WHERE salarie.identifiant = ? AND salarie.motDePasse = ?";

                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, identifiant);  
                stmt.setString(2, password);   

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
         
                    int typeId = rs.getInt("typeId");
                    
                    identifiantUtilisateurConnecte = identifiant;

                    if (typeId == 1) { 
                        dispose(); 
                        MenuPrincipalVendeur MenuPrincipalVendeur = new MenuPrincipalVendeur();
                        MenuPrincipalVendeur.setVisible(true);
                    } else if (typeId == 2) { 
                        dispose(); 
                        MenuPrincipalPreparateur MenuPrincipalPreparateur = new MenuPrincipalPreparateur();
                        MenuPrincipalPreparateur.setVisible(true);
                    } else {
                        JOptionPane.showMessageDialog(this, "Accès interdit pour ce rôle.", "Erreur", JOptionPane.ERROR_MESSAGE);
                    }
                } else {
                    JOptionPane.showMessageDialog(this, "Identifiant ou mot de passe incorrect.", "Erreur", JOptionPane.ERROR_MESSAGE);
                }
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Erreur de connexion à la base de données.", "Erreur", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Erreur de connexion à la base de données.", "Erreur", JOptionPane.ERROR_MESSAGE);
        }
    }
}
