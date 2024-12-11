package easybee2;

import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.GridLayout;
import javax.swing.*;
import javax.swing.border.Border;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.Dimension;

public class MenuPrincipalPreparateur extends JFrame {

    private static final long serialVersionUID = 1L;

    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MenuPrincipalPreparateur frame = new MenuPrincipalPreparateur();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public MenuPrincipalPreparateur() {
        setTitle("Menu Principal");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 400, 400);

        JPanel contentPane = new JPanel();
        contentPane.setBackground(Color.WHITE);
        setContentPane(contentPane);

        contentPane.setLayout(new GridLayout(3, 2, 0, 0));

        JButton btnPage1 = createButton("Afficher la liste des produits", "ListeProduit");
        JButton btnPage2 = createButton("Afficher la liste des commandes à préparer", "ListeCommande");
        JButton btnPage3 = createButton("Affecter une commande à préparer", "AffecterCommande");
        JButton btnPage4 = createButton("Saisir un bon de livraison", "SaiseBonLivraison");
        JButton btnPage5 = createButton("Imprimer un bon de livraison", "ImprimerBonLivraison");

        JPanel panelDeconnexionModifier = new JPanel();
        panelDeconnexionModifier.setLayout(new GridLayout(2, 1, 0, 0)); 
        JButton btnDeconnexion = createDeconnexionButton();
        JButton btnModifier = createModifierButton();

        panelDeconnexionModifier.add(btnDeconnexion);
        panelDeconnexionModifier.add(btnModifier);

        contentPane.add(btnPage1);
        contentPane.add(btnPage2);
        contentPane.add(btnPage3);
        contentPane.add(btnPage4);
        contentPane.add(btnPage5);
        contentPane.add(panelDeconnexionModifier); 
    }

    private JButton createButton(String text, String page) {
        JButton button = new JButton(text);
        button.setFont(new Font("Arial", Font.PLAIN, 11));
        button.setBackground(Color.WHITE);
        button.setForeground(Color.BLACK);
        button.setFocusPainted(false);
        button.setContentAreaFilled(false);

        Border border = BorderFactory.createLineBorder(Color.GRAY, 1);
        button.setBorder(border);

        button.setFocusable(false);

        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                ouvrirPage(page);
            }
        });

        return button;
    }

    private JButton createDeconnexionButton() {
        JButton button = new JButton("Déconnexion");
        button.setFont(new Font("Arial", Font.BOLD, 10)); 
        button.setBackground(Color.BLACK);  
        button.setForeground(Color.WHITE);  
        button.setFocusPainted(false);
        button.setContentAreaFilled(true);  
        button.setBorder(BorderFactory.createLineBorder(Color.BLACK, 2));  
        button.setPreferredSize(new Dimension(120, 30)); 

        button.setFocusable(false);

        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                confirmerDeconnexion();
            }
        });

        return button;
    }

    private JButton createModifierButton() {
        JButton button = new JButton("Modifier");
        button.setFont(new Font("Arial", Font.BOLD, 10)); 
        button.setBackground(Color.WHITE);  
        button.setForeground(Color.BLACK);  
        button.setFocusPainted(false);
        button.setContentAreaFilled(true);  
        button.setBorder(BorderFactory.createLineBorder(Color.WHITE, 2));  
        button.setPreferredSize(new Dimension(120, 30)); 

        button.setFocusable(false);

        button.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
            	dispose(); 
                new ModifierMotDePasse().setVisible(true); 
            }
        });

        return button;
    }

    private void confirmerDeconnexion() {
        int response = JOptionPane.showConfirmDialog(this, 
            "Êtes-vous sûr de vouloir vous déconnecter ?", 
            "Confirmation de déconnexion", 
            JOptionPane.YES_NO_OPTION, 
            JOptionPane.QUESTION_MESSAGE);
        
        if (response == JOptionPane.YES_OPTION) {
            deconnecterUtilisateur();
        }
    }

    private void deconnecterUtilisateur() {
        dispose(); 
        new SeConnecter().setVisible(true); 
    }

    private void ouvrirPage(String page) {
        dispose();
        switch (page) {
            case "ListeProduit":
                new ListeProduit().setVisible(true);
                break;
            case "ListeCommande":
                new ListeCommande().setVisible(true);
                break;
            case "AffecterCommande":
                new AffecterCommande().setVisible(true);
                break;
            case "SaiseBonLivraison":
                new SaisieBonLivraison().setVisible(true);
                break;
            case "ImprimerBonLivraison":
                new ImprimerBonLivraison().setVisible(true);
                break;
        }
    }
}
