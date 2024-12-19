# Explain Workspace and Prject Folders - Explain-Folders-README.md

December 18, 2024

The intent of this README is to explain the workspace environment files.

The program expects:
- A Workspace folder exists (and contains your project folders and files.)
- You created a project folder using "New Project Folder".
- You save the canvas to a "src" file.

As I added new features, it became necessary to persist information in various "project" files. At some point, the files become necessary and this could lead to user issues. This README documents the environment.

All files are text files that are managed by the IDE.  You can if needed edit a text file.

# PDLB Kit

The PDLB application is a python file using tkinter GUI commands to create the GUI Integrated Desktop Environment (IDE).  There are several dependencies. So to ease deployment for users, the program was "compiled" into PDLB.exe.  It was then copied to a folder structure and zipped.

The \bin files:
- pdlb.exe - the application executable
- code.txt - An example code file (should be copied and attached to a project.)
- recentfiles.pdlb - Text file listing recent files (displayed in a menu in IDE.)
- workspace.pdlb - Text file with last edited file (see below).

The other files:
- \bin\images are files for the IDE.
- \Example  any source example files.
- \images is the cross.jpg file.  This is a placeholder image.
- README.txt explains the kit files.

The kit unzips as:
<p align="left">
<img src="images\ExecutableAndFiles.jpg" width="200" title="Workspace" background="beige">
</p>

# workspace.pdlb file

This file attempts to remember the last file you entered and so when you restart the application, the default project folder is that directory.  This text file has a dictionary object with most recent file.  Here is an example:

{"Workspace":"C:/WorkspacePDLB","Project":"Video5","File":"PumpControl.src","DateTime":"2024-12-02 16:59:32"}

This means the application will display the current workspace and project directory as so:

- C:/WorkspacePDLB
- Video5

When you restart the application, You can edit "PumpControl.src":
- Open Recently Saved File <u>(Note: not working currently)</u>
- Open Source File from (use the wizard to sekect it)


# Workspace Environment

The picture below shows a single source file "test1.src"
that resides inside the "project1" directory that is within
the "WorkspacePDLB" directory.

<p align="left">
<img src="images\WorkspaceSingleFile.jpg" width="200" title="Workspace" background="beige">
</p>

The following should be noticed:
- Generated output is a file with the extension "bas". 
- There is file called builder_save.prj
- Inside every project directory is an "images" folder.
- Inside "images" is a file called cross.jpg (32x32 pixels).  Its a default.  Do not alter the image.

# The code file

Optionally, you can write MMBasic statements and place them in a text file.  When you use PDLB, there is a Global Property called "Code".  Enter the file's name into this field.  When you click "Build Controls with Code" (in the Generate menu) the contents of the "code" file are attached to the bottom of the generated graphics commands and become part of the "bas" text file. 

You should have these MMBasic statements in the file.

```
Sub INIT()
''  put code here
End Sub

Sub MAIN()
'' put code here
End Sub
```
# The "src" file

The source file contains a statement for global-property and every GUI object on the canvas.  (As an example) the contents of the file CheckBoxDisplay.src are displayed below:


```
{'BackgroundColor':'black','ForegroundColor':'white','Fontsize':'3','Fontscale':'1','Lastsave':'2024-09-23 14:43:12','Code':'','Controls-Max':'85','FirstRef':'1','Kit':'1.0','Workspace':'C:/WorkspacePDLB','Project':'Video3','File':'CheckBoxDisplay.src','Note':'notepad.exe','Addon':'C:/MMedit5/MMEdit.exe','AddonTarget':'BAS',}
{'Ref':'1','Setup':'0','Name':'','Caption':'Checkbox Demo','StartX':'255','StartY':'104','Width':'300','Height':'244','Colour':'cyan','Tool':'Frame',}
{'Ref':'2','Setup':'0','Name':'','Caption':'CB1','StartX':'310','StartY':'158','Size':'30','FColour':'white','Tool':'CheckBox','Default':'0',}
{'Ref':'3','Setup':'0','Name':'','Caption':'CB2','StartX':'310','StartY':'218','Size':'30','FColour':'white','Tool':'CheckBox','Default':'0',}
{'Ref':'4','Setup':'0','Name':'','Caption':'CB3','StartX':'308','StartY':'276','Size':'30','FColour':'white','Tool':'CheckBox','Default':'0',}
{'Ref':'5','Setup':'0','Name':'','StartX':'255','StartY':'416','Width':'300','Height':'40','FColour':'cyan','BColour':'black','Tool':'DisplayBox','Value':'msg$',}
{'Ref':'6','Setup':'0','Name':'','Text':'Click any Checkbox.','StartX':'261','StartY':'41','Alignment':'LT','FColour':'white','BColour':'black','Tool':'Caption','Value':'',}
{'Ref':'7','Setup':'0','Name':'','Text':'Display items checked:','StartX':'258','StartY':'377','Alignment':'LT','FColour':'white','BColour':'black','Tool':'Caption','Value':'',}
```

The first line is a dictionary that list of all of the global property fields.  Subsequent lines are dictionary statements (one line) for each GUI object.

One could edit this text file, then open it within PDLB. When PDLB opens a "src" file it reads each statement and adds the item as a GUI object to the canvas.  The "Ref" key is the MMBasic reference name of the GUI object. 

Statement Keys that interface the GUI object to other MMBasic items:
- Setup - Parent Ref number for a "Setup" page.  
- Name  - Alternate name for the GUI Object (used in place of Ref.)
- Default - Initial value displayed in the GUI object.
- Value - Runtime value (often a MMBasic variable.)

# The "bas" file

Clicking a menuitem under the Generate Menu will generate a "bas" file.  Since it uses the source "src" root name (you must have a "src" file first.)

This is a text file containing the MMBasic GUI commands.  If you further click on "invoke Addon", the default behavior will open the "bas" contents inside MMEdit.  There you can modify it further or deploy the code to the target (assumes you are using PicoMite).  <u>You should save the modified file with a different filename.</u>

Note: Modifications to a "bas" file are not backward compatible with PDLB. Further, clicking the generate again would overwrite the file.
