#!/bin/bash
# Pirmas atsiskaitymas
# Kiek vartotoju yra sistemoje?
# Kiek procesu yra pas kiekviena vartotoja?
# Kuris vartotojas turi daugiausiai procesu?

echo "Vartotojai sistemoje:"
wc -l < /etc/passwd

echo "Procesu skaicius pas kiekviena vartotoja:"
for useris in $(cut -d ":" -f 1 /etc/passwd); do
	echo -n $useris " "
	
	procesai=$(ps h -u $useris -o user | uniq -c | sed 's/[^0-9]//g')

	if [[ -z $procesai ]]; then
    		echo "0"
	else
    		echo "$procesai"
	fi
done

echo "Daugiausiai procesu turintis vartotojas:"
ps hax -o user | sort | uniq -c | sort -rn | head -1
