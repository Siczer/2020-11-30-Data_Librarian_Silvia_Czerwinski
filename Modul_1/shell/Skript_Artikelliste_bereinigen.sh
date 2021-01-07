# Dieses Skript soll eine Liste mit Titeln bereinigen, so dass sie nur noch die Spalten ISSN und Date beinhaltet
cut -f5,12 2020-12-04-Article_list_dirty.tsv > ISSN_Date_ausschneiden.tsv
# Die Spalten ISSN und Date werden ausgeschnitten und in eine neue Datei geschrieben
head -n 1 ISSN_Date_ausschneiden.tsv > 2020-12-04-Dates_and_ISSNs.tsv
# Schneidet die erste Zeile mit den Spaltenüberschriften aus und schreibt sie in die endgültige Datei.
tr -d "ISN:engisn " < 2020-12-04-Article_ISSN_Date.tsv > Ohne_Zeichen.tsv
# Alle Leerzeichen, : und vorhandene Buchstaben werden gelöscht und in eine neue Datei geschrieben
grep -E "[[:digit:]]{4}" Ohne_Zeichen.tsv >> 2020-12-04-Dates_and_ISSNs.tsv
# Es werden nur die Zeilen gesucht, die 4 Ziffern haben. Damit werden leere Zeilen und kleinere Zahlen gelöscht.
# Das Ergebnis wird in die endgültige Datei geschrieben und dort hinter die Spaltenüberschriften angehängt.
