#SQL-Database
CPSC-332
Created by Ashkon Yavarinia, Jerry Liu, and Stephen Merwin.

<br />
<h3 align="center">SQL Database Project</h3>

</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#bugs">Bugs</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

You are asked to design a database for a university that satises the following.

##### SQL

1. The database keeps information of each professor, including the social
security number, name, address, telephone number, sex, title, salary, and
college degrees. The address includes street address, city, state, and zip
code. The telephone number includes the area code and 7 digit number.

2. Each department has a unique number, name, telephone, oce location,
and a chairperson who is a professor.

3. Each course has a unique number, title, textbook, units. Each course also
has a set of prerequisite courses. Each course is oered by a department.

4. Each course may have several sections. Each section has a section number
that is unique within the course, a classroom, a number of seats, meeting
days, a beginning time, an ending time. Each section is taught by a profes-
sor.

5. The database keeps student records, including the campus wide ID, name,
address, and telephone number. Each student majors in one department and
may minor in several departments. The name includes rst name and last
name.

6. The database keeps enrollment records. Each record has a student, a
course section, and a grade.



Design your database and create at least the following numbers of records:
8 students 2 departments 3 professors
4 courses 6 sections 20 enrollment records

##### PHP

You should provide interfaces for the following individuals:
For the professors:
a. Given the social security number of a professor, list the titles, classrooms,
meeting days and time of his/her classes.

b. Given a course number and a section number, count how many students
get each distinct grade, i.e. `A', `A-', `B+', `B', `B-', etc.
For the students:

a. Given a course number list the sections of the course, including the class-
rooms, the meeting days and time, and the number of students enrolled in
each section.

b. Given the campus wide ID of a student, list all courses the student took
and the grades.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [SQL](https://dev.mysql.com/doc/)
* [PHP](https://www.php.net/)
* [MariaDB](https://mariadb.org/)
* [HTML](https://html.spec.whatwg.org/multipage/)


<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started
Access to the server might be required. The host server may be down

### Prerequisites
 No prerequisites

### Installation
To run the program, simply open index.html in a browser.

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



## Bugs
Bugs: None

<p align="right">(<a href="#top">back to top</a>)</p>
