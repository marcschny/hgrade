# Peer-Grading Programmierprojekt 

In dieser Phase werden die Projekte korrigiert. Jede und jeder von Ihnen korrigiert 5 zufällig ausgewählte und anonymisierte Lösungen von Ihren Kolleginnen und Kollegen.

Sie erhalten dabei einen lehrreichen Einblick, wie Mitstudierende die Aufgabe gelöst haben.

Die Korrektur ist Teil der Prüfung. Mittels statistischer Analysen werde ich auffällige Abweichungen feststellen. Sollte sich herausstellen, dass die Sorgfalt nicht in einem vernünftigen Rahmen liegt (z.B., wenn Sie überall 0 Pt reinschreiben), halte ich mir vor, dies negativ in Ihre Bewertung einfliessen zu lassen. Machen Sie sich aber keine Sorgen, wenn Sie die Arbeiten gewissenhaft nach den Vorgaben korrigieren, sind Sie auf der guten Seite.


In diesem [Video](https://tube.switch.ch/videos/851fe0d4) wird der Vorgang demonstriert.


## Ablauf
Ich habe einen Ordner namens `grading` in Ihr Repository geladen.
```
grading
├── 25668436-e2bf-44e5-a185-94ce27aea161.zip
├── 741fce70-a41d-4a2c-9a0b-df231b5f9578.zip
├── README.md
├── a1ae3ad7-5baf-4d56-aeb7-ef0304166237.zip
├── d3b1aa13-9ed4-408e-9e79-0dd39a07776c.zip
├── fab952d0-32c0-4462-ade6-f71ef16900c6.zip
└── grading.csv
```

Darin enthalten ist dieses `README.md`, fünf als `.zip` Datei komprimierte Lösungen von Ihren Kollegen und Kolleginnen und ein `grading.csv` File, in welches Sie Ihre Bewertungen eintragen.

Die Datei `grading.csv` hat beispielsweise folgenden Inhalt:
```csv
project,N1,N2,N3,N4,N5,N6,N7,N8,N9,F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13
741fce70-a41d-4a2c-9a0b-df231b5f9578,,,,,,,,,,,,,,,,,,,,,,
25668436-e2bf-44e5-a185-94ce27aea161,,,,,,,,,,,,,,,,,,,,,,
fab952d0-32c0-4462-ade6-f71ef16900c6,,,,,,,,,,,,,,,,,,,,,,
d3b1aa13-9ed4-408e-9e79-0dd39a07776c,,,,,,,,,,,,,,,,,,,,,,
a1ae3ad7-5baf-4d56-aeb7-ef0304166237,,,,,,,,,,,,,,,,,,,,,,
```
Die Erste Zeile ist der Header und beschreibt die Spalten.
In der ersten Spalte ist ein Projekt-Identifizierer. Für jede `.zip` Datei, also für jede Arbeit, die Sie korrigieren, gibt es hier einen Eintrag. Die anderen Spalten stehen für die beschriebenen Kriterien. Hier tragen Sie die Punkte gemäss Spezifikation als Zahlenwert ein. Zum Beispiel tragen Sie bei `N1` also `-50` oder `0` Punkte ein und bei `F1` entsprechen `0` oder `5` Punkte. Die Punktvergabe pro Kriterium ist nicht als Spektrum zu verstehen, sondern als "Alles oder Nichts". Bei `F1` können Sie also nicht `3` eintragen. Das wäre ein Korrekturfehler und wird überprüft und an Sie zurückgewiesen.

Um diese `grading.csv` Datei zu editieren, installieren Sie am besten die VSCode Extension **Edit csv** `janisdd.vscode-edit-csv` (siehe Video).

## Vorgehen
1. Kopieren Sie ein `.zip` File in einen Ordner ausserhalb Ihres Projekts (z.B. `~/Desktop/peergrading/`) und entzippen Sie es.
2. Öffnen Sie ein weiteres VSCode Window `File -> New Window` und öffnen Sie damit das entpackte Projekt. Beachten Sie, dass das Projekt auf der korrekten Ebene geöffnet werden muss (die Struktur sollte Ihnen vom eigenen Projekt bekannt vorkommen).
3. Packen Sie die darin das `data.zip` Archiv aus, damit Sie saubere Testdaten haben.
4. Starten Sie die Applikation im Terminal mit `cabal run hgrade`.
5. Nun bewerten Sie das Projekt nach den vorgegeben Kriterien im [README.md](../README.md). Die Punkte tragen Sie als Zahlenwert ins `grading.csv` _in Ihrem eigenen Projekt_ ein.
6. Überprüfen Sie die vergebenen Punkte mittels http://fprog.peergrading.rocks (siehe unten)
7. Wenn Sie ein Projekt bewertet haben, schliessen Sie das mit einem Commit und einem Push _Ihres Projektes_ ab.

Dies wiederholen Sie, bis alle 5 Projekte bewertet sind. Wenn alle 5 Projekte in _Ihrem_ `grading.csv` bewertet sind, sind Sie bereit für die Abgabe.

Um die Plausibilität Ihrer Bewertung zu überprüfen, habe ich eine kleine Webapplikation in Haskell implementiert und auf AWS deployed:
http://fprog.peergrading.rocks
Da können Sie Ihre `grading.csv` Datei hochladen und bekommen eine Rückmeldung, ob die eingefüllten Werte zulässig sind. Unzulässige Werte werden dabei in roter Farbe markiert. Wir schlagen vor, dass Sie nach jeder bewerteten Arbeit Ihre `grading.csv` Datei überprüfen, bevor Sie zur nächsten Arbeit weitergehen.

## Abgabe der Korrektur
Abgabetermin: **Donnerstag, 17.12.2020 23.59**.

Halten Sie diesen Abgabetermin bitte ein, weil es sonst eine Verzögerung für alle bedeutet. **Verspätete Abgaben werden mit Notenabzug bestraft.**

Die Abgabe der Arbeit findet über ein `git commit` und ein anschliessendes `push` statt. Die GIT-Commit-Message dieses letzten Commits soll `Grading EN2 <Ihre-FHNW-Mail-Adresse>` lauten. **Stellen Sie sicher, dass Ihre Mail-Adresse korrekt ist!** Bitte kontrollieren Sie, dass die Datei `grading.cvs` in der finalen Version eingechecked ist.
Die Abgabe findet wie üblich über den Master-Branch statt.

## Hinweise
Grundsatz: Wenn Sie Ihr eigenes Projekt in Betrieb nehmen konnten, dann sollten die Projekte, die Sie bewerten auch ausführbar sein (ausser natürlich, da gibt es klare Kompilationsfehler wie Syntax oder Typfehler). Ich bitte Sie, dass Sie sich echt bemühen die Arbeiten Ihrer Kolleginnen und Kollegen zum Laufen zu bringen. Sie erwarten ja auch, dass Ihre Arbeit in Betrieb genommen wird für die Bewertung.

Wenn eine Studierendenlösung nicht auf Anhieb funktioniert, versuchen Sie folgende Schritte:

1. Falls im Repo eine `NOTES.md` Datei vorhanden ist, schauen Sie da bitte rein. Bei ein paar Studierenden ist es notwendig ein anderes cabal Kommando auszuführen und das sollte da drin erwähnt sein.
2. `cabal clean` und dann nochmals versuchen.
3. Überprüfen Sie den Ordner, worin Sie die zu bewertende Lösung ausgepackt haben: 
   - Er soll nicht unter Kontrolle von Dropbox, Switchdrive etc. liegen
   - Die Ordnernamen sollen keine Spaces enthalten
   - Sie sollen Schreibberechtigung auf dem Ordner haben
4. Posten Sie die Probleme auf Piazza, dann können wir das zusammen lösen.