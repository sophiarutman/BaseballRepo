# BaseballRepo

To run this app: clone the repo to your own machine, and run "$rails s" in your integrated terminal. Then, open http://localhost:3000/baseball_app in your chosen web browser. 

Now, some details on how the lineup is decided...,

This is how we decide, in the order that we decide. We will chose the second batter first, the third batter second, etc.

2nd batter: highest added AVG and OBP

3rd batter: next highest AVG

1st batter: next highest OBP

4th batter; next highest SLG

5th batter: next highest OPS

6-9th: best averages of remaining players, in decreasing order. 6th will have the highest average of all remaining players, 7th will have the second highest, etc.

Now, generate your lineup!
