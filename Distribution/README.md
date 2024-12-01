# README.md - v1.0.1

There is a text README file inside the zip that gives simple instructions.
The kit can be installed anywhere, and then you should update Windows ENV Variables PATH to include the bin folder of the kit.

The PDLB program needs a Worksheet Folder (which it asks.)  Also,
suggest you create a New Project (which creates a subfolder.) But it
also creates an images folder, etc.

you can post issues or send me an email: aiy745321@gmail.com

k

# Update 24 September 2024

Release 1.0.1.  

Contains the improvements to Examples and a minor fix to the Setup Control.

# Update 01 December 2024

Release 1.0.2

Changed from Python 3.9 to Python 3.11. 3.11 is faster and more current.

# Procedure to follow when updating

first time invoking the program cuses the program to open the folder browser.
1. Locate your Workspace folder with mouse (.e.g. WorkspacePDLB ) and click Select Folder button.  
2. From FILE, click Open Project menu item.
3. Locate a project Folder and clict Select Folder button.
4. From File, click Open Source File from, and click Select button.

- NOTE: A project pust have WorkSpace + Project + source-File-name.... before you can generate a BAS file or push it to MMEdit.



# Wiring for InfoTwoPage program

Connect connection "dupont" wires between Pico pins and the onboard headers
as follows:

| Pico Pin | Header & Pin |
| -------- | ------------ |
| GP17     | Button 1 |
| GP21     | Button 2 |
| GP26     | Potentiometer |
| GP27     | LED 1 |
| GP28     | LED 2 |





