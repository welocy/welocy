*&---------------------------------------------------------------------*
*& Report zot_15_p_ogr_not
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_ogr_not.


 types zot_15_tt_ogr_not type table of zot_15_s_ogr_not.
 data: gt_ogr_not type zot_15_tt_ogr_not,
       gs_ogr_not type zot_15_s_ogr_not.

gs_ogr_not-student_id = 1.
gs_ogr_not-student_name = 'Ahmet'.
gs_ogr_not-student_birth = '19991117'.
gs_ogr_not-student_dep = 'Bilgisayar Mühendisliği'.

gs_ogr_not-student_not-not_class1 = '1.Sınıf'.
gs_ogr_not-student_not-not_class2 = '2.Sınıf'.
gs_ogr_not-student_not-not_class3 = '3.Sınıf'.
gs_ogr_not-student_not-not_class4 = '4.Sınıf'.

gs_ogr_not-student_not-not_class1-lesson1 = 'HTML Ders'.
gs_ogr_not-student_not-not_class1-lesson1 = 'C Ders'.
gs_ogr_not-student_not-not_class1-lesson1 = 'C++ Ders'.
gs_ogr_not-student_not-not_class1-lesson1 = 'JScript Ders'.
gs_ogr_not-student_not-not_class1-lesson1 = 'ABAP Ders'.

gs_ogr_not-student_not-not_class1-lesson1-vize1 = 50.
gs_ogr_not-student_not-not_class1-lesson1-vize2 = 40.
gs_ogr_not-student_not-not_class1-lesson1-final = 80.
gs_ogr_not-student_not-not_class1-lesson1-but = 95.

gs_ogr_not-student_not-not_class1-lesson2-vize1 = 60.
gs_ogr_not-student_not-not_class1-lesson2-vize2 = 40.
gs_ogr_not-student_not-not_class1-lesson2-final = 90.
gs_ogr_not-student_not-not_class1-lesson2-but = 95.

gs_ogr_not-student_not-not_class1-lesson3-vize1 = 20.
gs_ogr_not-student_not-not_class1-lesson3-vize2 = 15.
gs_ogr_not-student_not-not_class1-lesson3-final = 80.
gs_ogr_not-student_not-not_class1-lesson3-but = 100.

gs_ogr_not-student_not-not_class1-lesson4-vize1 = 80.
gs_ogr_not-student_not-not_class1-lesson4-vize2 = 90.
gs_ogr_not-student_not-not_class1-lesson4-final = 80.
gs_ogr_not-student_not-not_class1-lesson4-but = 95.

gs_ogr_not-student_not-not_class1-lesson5-vize1 = 20.
gs_ogr_not-student_not-not_class1-lesson5-vize2 = 500.
gs_ogr_not-student_not-not_class1-lesson5-final = 75.
gs_ogr_not-student_not-not_class1-lesson5-but = 95.







gs_ogr_not-student_not-not_class2-lesson1-vize1 = 50.
gs_ogr_not-student_not-not_class2-lesson1-vize2 = 40.
gs_ogr_not-student_not-not_class2-lesson1-final = 80.
gs_ogr_not-student_not-not_class2-lesson1-but = 95.

gs_ogr_not-student_not-not_class2-lesson2-vize1 = 60.
gs_ogr_not-student_not-not_class2-lesson2-vize2 = 40.
gs_ogr_not-student_not-not_class2-lesson2-final = 90.
gs_ogr_not-student_not-not_class2-lesson2-but = 95.

gs_ogr_not-student_not-not_class2-lesson3-vize1 = 20.
gs_ogr_not-student_not-not_class2-lesson3-vize2 = 15.
gs_ogr_not-student_not-not_class2-lesson3-final = 80.
gs_ogr_not-student_not-not_class2-lesson3-but = 100.

gs_ogr_not-student_not-not_class2-lesson4-vize1 = 80.
gs_ogr_not-student_not-not_class2-lesson4-vize2 = 90.
gs_ogr_not-student_not-not_class2-lesson4-final = 80.
gs_ogr_not-student_not-not_class2-lesson4-but = 95.

gs_ogr_not-student_not-not_class2-lesson5-vize1 = 20.
gs_ogr_not-student_not-not_class2-lesson5-vize2 = 500.
gs_ogr_not-student_not-not_class2-lesson5-final = 75.
gs_ogr_not-student_not-not_class2-lesson5-but = 95.






gs_ogr_not-student_not-not_class3-lesson1-vize1 = 50.
gs_ogr_not-student_not-not_class3-lesson1-vize2 = 40.
gs_ogr_not-student_not-not_class3-lesson1-final = 80.
gs_ogr_not-student_not-not_class3-lesson1-but = 95.

gs_ogr_not-student_not-not_class3-lesson2-vize1 = 60.
gs_ogr_not-student_not-not_class3-lesson2-vize2 = 40.
gs_ogr_not-student_not-not_class3-lesson2-final = 90.
gs_ogr_not-student_not-not_class3-lesson2-but = 95.

gs_ogr_not-student_not-not_class3-lesson3-vize1 = 20.
gs_ogr_not-student_not-not_class3-lesson3-vize2 = 15.
gs_ogr_not-student_not-not_class3-lesson3-final = 80.
gs_ogr_not-student_not-not_class3-lesson3-but = 100.

gs_ogr_not-student_not-not_class3-lesson4-vize1 = 80.
gs_ogr_not-student_not-not_class3-lesson4-vize2 = 90.
gs_ogr_not-student_not-not_class3-lesson4-final = 80.
gs_ogr_not-student_not-not_class3-lesson4-but = 95.

gs_ogr_not-student_not-not_class3-lesson5-vize1 = 20.
gs_ogr_not-student_not-not_class3-lesson5-vize2 = 500.
gs_ogr_not-student_not-not_class3-lesson5-final = 75.
gs_ogr_not-student_not-not_class3-lesson5-but = 95.







gs_ogr_not-student_not-not_class4-lesson1-vize1 = 50.
gs_ogr_not-student_not-not_class4-lesson1-vize2 = 40.
gs_ogr_not-student_not-not_class4-lesson1-final = 80.
gs_ogr_not-student_not-not_class4-lesson1-but = 95.

gs_ogr_not-student_not-not_class4-lesson2-vize1 = 60.
gs_ogr_not-student_not-not_class4-lesson2-vize2 = 40.
gs_ogr_not-student_not-not_class4-lesson2-final = 90.
gs_ogr_not-student_not-not_class4-lesson2-but = 95.

gs_ogr_not-student_not-not_class4-lesson3-vize1 = 20.
gs_ogr_not-student_not-not_class4-lesson3-vize2 = 15.
gs_ogr_not-student_not-not_class4-lesson3-final = 80.
gs_ogr_not-student_not-not_class4-lesson3-but = 100.

gs_ogr_not-student_not-not_class4-lesson4-vize1 = 80.
gs_ogr_not-student_not-not_class4-lesson4-vize2 = 90.
gs_ogr_not-student_not-not_class4-lesson4-final = 80.
gs_ogr_not-student_not-not_class4-lesson4-but = 95.

gs_ogr_not-student_not-not_class4-lesson5-vize1 = 20.
gs_ogr_not-student_not-not_class4-lesson5-vize2 = 500.
gs_ogr_not-student_not-not_class4-lesson5-final = 75.
gs_ogr_not-student_not-not_class4-lesson5-but = 95.



append gs_ogr_not to gt_ogr_not.

cl_demo_output=>display_data( gt_ogr_not ).
**
*       gt_ogr_not = value #( ( student_id = 1
*                                            student_name = 'Ahmet'
*                                            student_birth = '19991117'
*                                            student_dep = 'Bilgisayar Mühendisliği'
*                                                student_not-not_class1 = 'ABAP'
*

*break-POINT.
