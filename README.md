## CSC/ECE 517 - Object Oriented Design and Development
## Program 2 - Ruby on Rails - Library Management

# Team
* Daniel Mendez Lozada
* Deeksha Rao
* Aidan Maycock

# Links

[Requirements Review](https://docs.google.com/document/d/1A2-CUS2L1p53WVMInx_t4NSveBCi9HOzMBihZ65bKI8/edit?usp=sharing)

[Heroku Link](https://lit-atoll-42842.herokuapp.com/)

# Admin Login
* Admin credentials: admin@ncsu.edu  admin123

# Admin Features
* Log in to the home page using the preassigned email and password, takes you to dashboard.
* View profile by clicking on profile, once on page edit link will allow changes to be made.
* Dashboard links to librarians and students allow admins to list users. Links to the right of a user allow changes to be made.
* The admin can approve and promote any student to librarian by editing their user profile.
* Links to libraries and books will list each database. Links next to each will allow changes to be made to each, including deletion. The details page for books lists the borrowing history at the bottom.
* The new book and new library buttons at the bottom of their respective lists allow for new entries to be added.
* The hold requests links will list all active hold requests.

# Librarian Login
* Test Librarian credentials: librarian@ncsu.edu  librarian

# Librarian Features
* Librarians can be created by signing up as a student but assigning a library id to a user. An admin can then choose to promote a user to librarian.
* Once the dashboard is reached the librarian can view and edit their profile by clicking the profile button. 
* Clicking the Libraries link will list all libraries, with the links next to each entry allowing editing details.
* Clicking trhe Books link lists all books and allows the librarian to view edit and remove books from the availability list.
* Using the view approval list the librarian can see the pending hold request and use the approve link to allow students to checkout special collection books.
* The checked out lists shows all hold requests that have been checked out by the students.
* Clicking the details link on any book will show the checkout history of the book.

# Student Login
* Test Student credentials: student@ncsu.edu student1

# Student Features
* Using the libraries link students can view the list of libraries. Clicking the details button will show a single library.
* Using the books link allows the student to list all books, see a book in detail, and create a new checkout/hold request.
* The books list also allows the user to search the book list by title, author, subject, and release date. 
* The hold requests link will show any existing hold requests for the student and will allow students to edit and delete requests. 

# Bonus Features
* The Google Login link on the homepage allows new users to sign in with their google credentials. The google account gives few details so most details are assigned by defualt, and an admin will need to update them later.