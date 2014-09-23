#!/bin/bash
# Pirmas atsiskaitymas
# Kiek vartotoju yra sistemoje?
# Kiek procesu yra pas kiekviena vartotoja?
# Kuris vartotojas turi daugiausiai procesu?

echo "Vartotojai sistemoje:"
wc -l < /etc/passwd
echo "Procesu skaicius pas kiekviena vartotoja:"
ps hax -o user | sort | uniq -c | sort -rn 
echo "Daugiausiai procesu turintis vartotojas:"
ps hax -o user | sort | uniq -c | sort -rn | head -1
