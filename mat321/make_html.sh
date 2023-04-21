
#!/bin/bash
for i in {2..5}
do
   jupyter nbconvert --to html problem_sets/hw$i/hw$i.ipynb
done


for i in {3..9}
do
   jupyter nbconvert --to html precepts/precept0$i/precept$i.ipynb
done

for i in {10..11}
do
   jupyter nbconvert --to html precepts/precept$i/precept$i.ipynb
done


