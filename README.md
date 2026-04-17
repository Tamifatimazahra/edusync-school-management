
#  Gestion Scolaire - Schéma de Base de Données

# Contexte
Ce projet modélise une base de données pour un système de gestion scolaire.  
Il permet de gérer les utilisateurs, leurs rôles, les classes, les cours, les étudiants et leurs inscriptions.

---

##  Relations entre les tables (Choix clés)

 1:1 (One-to-Oneor many)
- **students ↔ users**  
  Un étudiant est un utilisateur, mais tous les utilisateurs ne sont pas forcément étudiants.  
  La table `students` contient une clé étrangère `id_users` qui pointe vers `users(id)`.  
  → *Un seul étudiant peut être lié à un seul compte utilisateur.*

---

### 1:N (One-to-Many)

1. **roles → users**  
   Un rôle (Admin, Prof, Student) peut être attribué à plusieurs utilisateurs.  
   → `users.id_role` référence `roles.id_role`.

2. **classes → students**  
   Une classe peut contenir plusieurs étudiants.  
   → `students.id_classes` référence `classes.id_classes`.

3. **users → courses** (via `courses.id_teacher`)  
   Un professeur (utilisateur avec rôle `Prof`) peut enseigner plusieurs cours.  
   → `courses.id_teacher` référence `users.id_users`.

4. **students → enrollments**  
   Un étudiant peut avoir plusieurs inscriptions.  
   → `enrollments.id_students` référence `students.id_students`.

5. **courses → enrollments**  
   Un cours peut avoir plusieurs inscriptions.  
   → `enrollments.id_courses` référence `courses.id_courses`.

---

###  N:N (Many-to-Many via table de jointure)

- **students ↔ courses**  
  Un étudiant peut suivre plusieurs cours.  
  Un cours peut être suivi par plusieurs étudiants.  
  → Table `enrollments` (table de jointure) avec :  
  - `id_students` → FK vers `students`  
  - `id_courses` → FK vers `courses`  
  - Clé unique composite `(id_students, id_courses)` pour éviter les doublons d’inscription.

---

---

## Contraintes d’intégrité
- `ON DELETE RESTRICT` sur les FK critiques (ex: suppression d’un user supprimerait ses inscriptions ? non, bloqué si lié).
- `ON DELETE CASCADE` peut être utilisé sur `enrollments` si on veut supprimer automatiquement les inscriptions quand un étudiant/cours est supprimé.
- `UNIQUE` sur `users.email` et `students.student_number`.

---

##  Normalisation
- **1FN** : toutes les valeurs sont atomiques.
- **2FN** : toutes les colonnes dépendent de la clé primaire.
- **3FN** : pas de dépendance transitive (ex: `student_number` ne dépend que de `students`, pas de `classes`).

---

## Fichiers fournis
- `structure.sql` : création de la base et des tables.
- `seed.sql` : données de test cohérentes.
- `README.md` : ce fichier.