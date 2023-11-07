Ciopa Cristian Mihai - 311CA

Task1-
In generate_probabilities_system.m sunt initializate la inceput A- ul si b-ul  cu 0.
Apoi este hardcodat varful triunghiului deoarece este mentionat ca rows > 2.
Ulterior sunt discutate fiecare caz privind parintii si copii din partea dreapta si stanga pentru a intelege
ce fel de nod este nodul curent si cum trebuie facuta ecuatia acestuia.
Cand se ajunge la baza triunghiului, acolo unde soarecele gaseste de mancare, este analizata relatia cu fiecare nod: daca este in coltul din
stanga/dreapta triunghiului, daca este la mijloc si astfel se construeste ecuatia. Pentru acestea am folosit for-uri care parcurgeau fiecare sectiune indicata.

In matrix_to_csr.m observam ca pentru values luam elementle nenule din matrice.
   colind se iau pozitiile acestor din cadrul randurilor in care se incadreaza.
   pentru rowptr se identifica valoarea acestor in functie de colind si values.
Se foloseste for pentru a parcurge toate elementele matricei formate si prin if uri se determina cum trebuies incadrate in cei 3 vectori.

Task2-
Pentru clustering_pc.m:
Se stabilesc clusterele initiale dupa formula i + NC * count <= nr_linii.
Apoi se determina centroizii initiali, parcurgandmatricea de clustere.
Apoi se face calcularea distantei dintre centroizi si puncte tot prin parcurgerea matricei de centroizi si points.
Se face o determinare conform careia se vede distanta minima pana la punct, si cel mai apropiat cluster.
Se cacluleaza prin length_cluster dimensiunea clusterului.
Se face un maxim pentru a stii cate coloane va avea urmatoarea matrice de clustere.
Apoi este realizat un counter, prin intermediul caruia sunt create noile clustere cu noii centroizi.
Acum se intra intr un while, care functioneaza pe principiul variabilei semafor, atunci cand centroizii aneriori sunt egali cu cei actuali, atunci while ul se termina 
si sunt gasiti centroizii finali. Procedeul este similar cu cel de lla gasirea primilor centroizi, doar ca este pus intr-un while.
Pentru compute_cost_pc.m:
Se calculeaza distanta dintre centrozomii finali si puncte.

Task3-
Cu imread iau calea catre poza.
Cu A(i,j,1/2/3) ma refer la matricele de pixeli rosi/verzi/albastri.
Count_bins este numarul de intervale.
la rgb am incercat prin vectorizari si nu mi-a iesit, iar la csv mi-a iesit simplu, a trebuit doar sa modularizez rezolvarea.
Tot ce a fost dat in pdf am facut pentru toti pixelisi am transformat matricea de pixeli intr-un vector pt fiecare culoare.
La rgb nu inteleg de ce nu-mi da, dar la hsv da.