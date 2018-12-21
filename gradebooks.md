# Gradebooks DB
This repo contains ER diagram and some examples of SQL quries for students gradebooks
## ER-Diagram
![](https://raw.githubusercontent.com/TarSen99/DB/master/er.PNG)
## Tools
* MySQL 8.0
* Workbench MySQL 8.0
* Used [draw io](Draw.io) for creating ER-diagram

## Link to bd dump
[clik here](https://github.com/TarSen99/DB/blob/master/gradebooks_dump.sql)

## Link to RE.xml
[click](https://github.com/TarSen99/DB/blob/master/Gradebooks.xml)

## Examples of sql queries

Select grades for just one student
```sql
SELECT `gradebooks`.Students.student_name, `gradebooks`.Students.student_surname,
`gradebooks`.Students.student_course, `gradebooks`.Specialities.Speciality_short_name,
`gradebooks`.Subjects.subject_name, `gradebooks`.Grades.grade,  `gradebooks`.Grade_types.grade_type_name 
FROM `gradebooks`.Students
JOIN `gradebooks`.StudentsAndSpecialities ON `gradebooks`.Students.student_id = `gradebooks`.StudentsAndSpecialities.student_id
JOIN `gradebooks`.Specialities ON `gradebooks`.StudentsAndSpecialities.Speciality_id = `gradebooks`.Specialities.Speciality_id
JOIN `gradebooks`.Gradebooks ON `gradebooks`.Students.student_id = `gradebooks`.Gradebooks.student_id
JOIN `gradebooks`.Grades ON `gradebooks`.Gradebooks.student_id = `gradebooks`.Grades.gradebook_id
JOIN `gradebooks`.Subjects ON `gradebooks`.Grades.subject_id = `gradebooks`.Subjects.subject_id
JOIN `gradebooks`.Grade_types ON `gradebooks`.Grades.grade_type_id = `gradebooks`.Grade_types.grade_type_id
WHERE `gradebooks`.Students.student_id = 1;
```
##### result:
![](https://github.com/TarSen99/DB/blob/master/1.PNG?raw=true)

Select all grades for one speciality
```sql
SELECT `gradebooks`.Students.student_name, `gradebooks`.Students.student_surname,
`gradebooks`.Students.student_course, `gradebooks`.Specialities.Speciality_short_name,
`gradebooks`.Subjects.subject_name, `gradebooks`.Grades.grade,  `gradebooks`.Grade_types.grade_type_name 
FROM `gradebooks`.Students
JOIN `gradebooks`.StudentsAndSpecialities ON `gradebooks`.Students.student_id = `gradebooks`.StudentsAndSpecialities.student_id
JOIN `gradebooks`.Specialities ON `gradebooks`.StudentsAndSpecialities.Speciality_id = `gradebooks`.Specialities.Speciality_id
JOIN `gradebooks`.Gradebooks ON `gradebooks`.Students.student_id = `gradebooks`.Gradebooks.student_id
JOIN `gradebooks`.Grades ON `gradebooks`.Gradebooks.student_id = `gradebooks`.Grades.gradebook_id
JOIN `gradebooks`.Subjects ON `gradebooks`.Grades.subject_id = `gradebooks`.Subjects.subject_id
JOIN `gradebooks`.Grade_types ON `gradebooks`.Grades.grade_type_id = `gradebooks`.Grade_types.grade_type_id
WHERE `gradebooks`.StudentsAndSpecialities.Speciality_id = 1 
ORDER BY `gradebooks`.Students.student_id;
```
##### result:
![](https://github.com/TarSen99/DB/blob/master/2.PNG?raw=true)

Select grades for some subject for some speciality
```sql
SELECT `gradebooks`.Students.student_name, `gradebooks`.Students.student_surname,
`gradebooks`.Students.student_course, `gradebooks`.Specialities.Speciality_short_name,
`gradebooks`.Subjects.subject_name, `gradebooks`.Grades.grade,  `gradebooks`.Grade_types.grade_type_name 
FROM `gradebooks`.Students
JOIN `gradebooks`.StudentsAndSpecialities ON `gradebooks`.Students.student_id = `gradebooks`.StudentsAndSpecialities.student_id
JOIN `gradebooks`.Specialities ON `gradebooks`.StudentsAndSpecialities.Speciality_id = `gradebooks`.Specialities.Speciality_id
JOIN `gradebooks`.Gradebooks ON `gradebooks`.Students.student_id = `gradebooks`.Gradebooks.student_id
JOIN `gradebooks`.Grades ON `gradebooks`.Gradebooks.student_id = `gradebooks`.Grades.gradebook_id
JOIN `gradebooks`.Subjects ON `gradebooks`.Grades.subject_id = `gradebooks`.Subjects.subject_id
JOIN `gradebooks`.Grade_types ON `gradebooks`.Grades.grade_type_id = `gradebooks`.Grade_types.grade_type_id
WHERE `gradebooks`.Subjects.subject_id = 1 AND `gradebooks`.StudentsAndSpecialities.Speciality_id = 1
ORDER BY `gradebooks`.Students.student_id;
```
##### result:
![](https://github.com/TarSen99/DB/blob/master/3.PNG?raw=true)

select students with speciality from some chair with avg grade > 90
```sql
 SELECT `gradebooks`.Students.student_name, `gradebooks`.Students.student_surname,
`gradebooks`.Students.student_course, `gradebooks`.Specialities.Speciality_short_name,
avg( `gradebooks`.Grades.grade) as "Grade_avg"
FROM `gradebooks`.Students
JOIN `gradebooks`.StudentsAndSpecialities ON `gradebooks`.Students.student_id = `gradebooks`.StudentsAndSpecialities.student_id
JOIN `gradebooks`.Specialities ON `gradebooks`.StudentsAndSpecialities.Speciality_id = `gradebooks`.Specialities.Speciality_id
JOIN `gradebooks`.Gradebooks ON `gradebooks`.Students.student_id = `gradebooks`.Gradebooks.student_id
JOIN `gradebooks`.Grades ON `gradebooks`.Gradebooks.student_id = `gradebooks`.Grades.gradebook_id
JOIN `gradebooks`.Subjects ON `gradebooks`.Grades.subject_id = `gradebooks`.Subjects.subject_id
JOIN `gradebooks`.Grade_types ON `gradebooks`.Grades.grade_type_id = `gradebooks`.Grade_types.grade_type_id
WHERE `gradebooks`.Specialities.chair_id = 1 AND (SELECT AVG(`gradebooks`.Grades.grade) > 90 
GROUP BY `gradebooks`.Grades.gradebook_id) GROUP BY `gradebooks`.Grades.gradebook_id; 
```
##### result:
![](https://github.com/TarSen99/DB/blob/master/4.PNG?raw=true)

Select grades for only exams for one speciality
```sql
 SELECT `gradebooks`.Students.student_name, `gradebooks`.Students.student_surname,
`gradebooks`.Students.student_course, `gradebooks`.Specialities.Speciality_short_name,
avg( `gradebooks`.Grades.grade) as "Grade_avg"
FROM `gradebooks`.Students
JOIN `gradebooks`.StudentsAndSpecialities ON `gradebooks`.Students.student_id = `gradebooks`.StudentsAndSpecialities.student_id
JOIN `gradebooks`.Specialities ON `gradebooks`.StudentsAndSpecialities.Speciality_id = `gradebooks`.Specialities.Speciality_id
JOIN `gradebooks`.Gradebooks ON `gradebooks`.Students.student_id = `gradebooks`.Gradebooks.student_id
JOIN `gradebooks`.Grades ON `gradebooks`.Gradebooks.student_id = `gradebooks`.Grades.gradebook_id
JOIN `gradebooks`.Subjects ON `gradebooks`.Grades.subject_id = `gradebooks`.Subjects.subject_id
JOIN `gradebooks`.Grade_types ON `gradebooks`.Grades.grade_type_id = `gradebooks`.Grade_types.grade_type_id
WHERE `gradebooks`.Specialities.chair_id = 1 AND (SELECT AVG(`gradebooks`.Grades.grade) > 90 
GROUP BY `gradebooks`.Grades.gradebook_id) GROUP BY `gradebooks`.Grades.gradebook_id; 
```
##### result:
![](https://github.com/TarSen99/DB/blob/master/5.PNG?raw=true)
