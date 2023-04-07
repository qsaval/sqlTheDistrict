-- Afficher la liste des commandes ( la liste doit faire apparaitre la date, les informations du client, le plat et le prix )
SELECT commande.nom_client, commande.telephone_client, commande.email_client, commande.adresse_client, commande.date_commande, plat.libelle, commande.total 
FROM commande 
JOIN commande_plat ON commande.id = commande_plat.commande_id 
JOIN plat ON commande_plat.plat_id = plat.id; 

-- Afficher la liste des plats en spécifiant la catégorie
SELECT plat.libelle, categorie.libelle
FROM plat
JOIN categorie ON categorie.id = plat.categorie_id; 

-- Afficher les catégories et le nombre de plats actifs dans chaque catégorie
SELECT categorie.libelle, COUNT(plat.libelle) 
FROM categorie 
JOIN plat on plat.categorie_id = categorie.id 
WHERE plat.active = 'Yes'
GROUP BY categorie.libelle; 

-- Liste des plats les plus vendus par ordre décroissant
SELECT plat.libelle, COUNT(commande_plat.commande_id) 
FROM plat 
JOIN commande_plat ON commande_plat.plat_id = plat.id 
GROUP BY plat.libelle 
ORDER BY COUNT(commande_plat.commande_id) DESC; 

-- Le plat le plus rémunérateur
SELECT plat.libelle, MAX(plat.prix)
FROM plat (**)

-- Liste des clients et le chiffre d'affaire généré par client (par ordre décroissant)
SELECT commande.nom_client, commande.total 
FROM commande 
ORDER BY commande.total DESC;

-- Ecrivez une requête permettant de supprimer les plats non actif de la base de données
DELETE FROM plat WHERE plat.active = 'No'

-- Ecrivez une requête permettant de supprimer les commandes avec le statut livré
DELETE FROM commande WHERE commande.etat = 'Livrée'

-- Ecrivez un script sql permettant d'ajouter une nouvelle catégorie et un plat dans cette nouvelle catégorie.
use the_district

INSERT INTO categorie (id, libelle, image, active)

INSERT INTO plat (id, categorie_id, libelle, description, prix, image, active)

-- Ecrivez une requête permettant d'augmenter de 10% le prix des plats de la catégorie 'Pizza' 
UPDATE plat 
JOIN categorie ON categorie.id = plat.categorie_id
SET plat.prix = plat.prix *1.01
WHERE categorie.libelle = 'Pizza';