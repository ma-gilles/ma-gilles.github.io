
#!/bin/bash
for i in {2..5}
do
   jupyter nbconvert --to html problem_sets/hw$i/hw$i.ipynb
done


for i in {2..12}
do
   jupyter nbconvert --to html problem_sets/hw$i/hw$i.ipynb
done



