package easybee2;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.border.EtchedBorder;
import javax.swing.table.DefaultTableModel;

public class SaisieBonLivraison extends JFrame {

    private static final long serialVersionUID = 1L;
    private JPanel contentPane;
    private JTable table;
    private DefaultTableModel model;
    private JComboBox<String> commandeComboBox;
    private int selectedCommandId = -1;

    public static void main(String[] args) {
        EventQueue.invokeLater(() -> {
            try {
                SaisieBonLivraison frame = new SaisieBonLivraison();
                frame.setVisible(true);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    public SaisieBonLivraison() {
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 650, 500);
        contentPane = new JPanel();
        contentPane.setBackground(Color.WHITE);
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        contentPane.setLayout(null);

        JPanel headerPanel = new JPanel();
        headerPanel.setBounds(0, 0, 650, 80);
        contentPane.add(headerPanel);
        headerPanel.setLayout(null);

        JLabel titleLabel = new JLabel("Saisir un bon de livraison");
        titleLabel.setFont(new Font("Arial", Font.BOLD, 16));
        titleLabel.setBounds(20, 32, 300, 20);
        headerPanel.add(titleLabel);

        JButton btnRetour = new JButton("Retour");
        btnRetour.setForeground(Color.BLACK);
        btnRetour.setFont(new Font("Arial", Font.PLAIN, 11));
        btnRetour.setBackground(Color.WHITE);
        btnRetour.setBounds(0, 0, 89, 23);

        btnRetour.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                dispose(); 
                new MenuPrincipalPreparateur().setVisible(true);  
            }
        });
        headerPanel.add(btnRetour);

        JLabel instructionLabel1 = new JLabel("1 - Sélectionner une commande");
        instructionLabel1.setFont(new Font("Arial", Font.ITALIC, 12));
        instructionLabel1.setBounds(22, 90, 250, 20);
        contentPane.add(instructionLabel1);

        commandeComboBox = new JComboBox<>();
        commandeComboBox.setForeground(Color.BLACK);
        commandeComboBox.setFont(new Font("Arial", Font.PLAIN, 12));
        commandeComboBox.setBounds(22, 120, 200, 25);
        commandeComboBox.addActionListener(e -> loadCommandDetails());
        contentPane.add(commandeComboBox);

        JLabel instructionLabel2 = new JLabel("2 - Saisir les quantités préparées");
        instructionLabel2.setFont(new Font("Arial", Font.ITALIC, 12));
        instructionLabel2.setBounds(22, 160, 250, 20);
        contentPane.add(instructionLabel2);

        model = new DefaultTableModel();
        model.addColumn("Désignation Produit");
        model.addColumn("Qte Commandée");
        model.addColumn("Qte Préparée");

        table = new JTable(model);
        table.setFont(new Font("Arial", Font.PLAIN, 12));
        table.setBorder(new EtchedBorder(EtchedBorder.LOWERED, null, null));
        table.setRowHeight(30);

        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.setBounds(22, 190, 600, 150);
        contentPane.add(scrollPane);

        JButton btnValider = new JButton("Valider");
        btnValider.setForeground(Color.WHITE);
        btnValider.setBackground(new Color(0, 123, 255));
        btnValider.setFont(new Font("Arial", Font.PLAIN, 12));
        btnValider.setBounds(223, 369, 200, 30);
        btnValider.addActionListener(e -> validerBonLivraison());
        contentPane.add(btnValider);

        loadCommandList();
    }

    private void loadCommandList() {
        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            try {
                String query = "SELECT DISTINCT cmdapprodepot.id "
                        + "FROM cmdapprodepot "
                        + "WHERE statutCommande = 'En cours'";

                PreparedStatement stmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery();

                commandeComboBox.removeAllItems();

                while (rs.next()) {
                    String commandeId = rs.getString("id");
                    commandeComboBox.addItem(commandeId);
                }
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Erreur lors du chargement des commandes.", "Erreur", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Erreur : Connexion à la base de données non établie.", "Erreur", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void loadCommandDetails() {
        String selectedCommand = (String) commandeComboBox.getSelectedItem();

        if (selectedCommand == null || selectedCommand.isEmpty()) {
            return;
        }

        selectedCommandId = Integer.parseInt(selectedCommand);

        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            try {
                String query = "SELECT designationProduit, qteCmd, cmdapprodepot.id "
                        + "FROM detailsproduit "
                        + "JOIN produit ON detailsproduit.idProduit = produit.id "
                        + "JOIN cmdapprodepot ON detailsproduit.idCommande = cmdapprodepot.id "
                        + "WHERE idCommande = ?";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setInt(1, selectedCommandId);
                ResultSet rs = stmt.executeQuery();

                model.setRowCount(0);

                while (rs.next()) {
                    String designationProduit = rs.getString("designationProduit");
                    int qteCmd = rs.getInt("qteCmd");
                    model.addRow(new Object[]{designationProduit, qteCmd});
                }

                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Erreur lors du chargement des détails de la commande.", "Erreur", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Erreur : Connexion à la base de données non établie.", "Erreur", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void validerBonLivraison() {
        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            try {
                String insertQuery = "INSERT INTO bondelivraison (dateLivraison) VALUES (CURRENT_DATE)";
                PreparedStatement stmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.executeUpdate();

                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                int idBonLivraison = rs.getInt(1);

                for (int row = 0; row < model.getRowCount(); row++) {
                    String designationProduit = (String) model.getValueAt(row, 0);
                    int qtePrepa = Integer.parseInt((String) model.getValueAt(row, 2));
                    int idCmdApproDepot = getCmdApproDepotId(selectedCommandId);

                    int productId = getProductId(designationProduit);
                    if (productId != -1) {
                        String detailQuery = "INSERT INTO detaillivraison (idBonLivraison, idProduit, idCmdeAppropDepot, qtePrepa) "
                                + "VALUES (?, ?, ?, ?)";
                        PreparedStatement stmtDetail = conn.prepareStatement(detailQuery);
                        stmtDetail.setInt(1, idBonLivraison);
                        stmtDetail.setInt(2, productId);
                        stmtDetail.setInt(3, idCmdApproDepot);
                        stmtDetail.setInt(4, qtePrepa);
                        stmtDetail.executeUpdate();
                    } else {
                        throw new Exception("Produit non trouvé pour la désignation : " + designationProduit);
                    }
                }
                
                String updateQuery = "UPDATE cmdapprodepot SET statutCommande = 'Préparée' WHERE id = ?";
                PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                updateStmt.setInt(1, selectedCommandId);
                updateStmt.executeUpdate();
                updateStmt.close();

                JOptionPane.showMessageDialog(this, "Bon de livraison validé avec succès !");
                loadCommandList();
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
                JOptionPane.showMessageDialog(this, "Erreur lors de la validation du bon de livraison.", "Erreur", JOptionPane.ERROR_MESSAGE);
            }
        } else {
            JOptionPane.showMessageDialog(this, "Erreur : Connexion à la base de données non établie.", "Erreur", JOptionPane.ERROR_MESSAGE);
        }
    }

    private int getProductId(String designationProduit) throws SQLException {
        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            String query = "SELECT id FROM produit WHERE designationProduit = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, designationProduit);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int productId = rs.getInt("id");
                stmt.close();
                return productId;
            }
            stmt.close();
        }
        throw new SQLException("Produit non trouvé pour la désignation : " + designationProduit);
    }

    private int getCmdApproDepotId(int idCommande) throws SQLException {
        Connection conn = ConnexionBaseDeDonnees.getConnection();
        if (conn != null) {
            String query = "SELECT id FROM cmdapprodepot WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, idCommande);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int idCmdApproDepot = rs.getInt("id");
                stmt.close();
                return idCmdApproDepot;
            }
            stmt.close();
        }
        throw new SQLException("Commande non trouvée pour l'identifiant : " + idCommande);
    }
}

