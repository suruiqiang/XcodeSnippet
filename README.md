
# Xcode Code Snippets
I want to present you some convenient code snippets I gathered recently for Objective-C。 My snippets focus on follow areas:

* UIKit Elements.  
* delegate and datasource implementation
* network
* animation

## Install & UnInstall
To use the snippets you will want to place them in the following folder
Build the XcodeSnippet target in the Xcode project and the plug-in will automatically be installed in 
~/Library/Application Support/Developer/Shared/Xcode/Plug-ins/  and snippets files will automatically be installed in ~/Library/Developer/Xcode/UserData/CodeSnippets/   Relaunch Xcode and imageNamed: will magically start autocompleting your images.

If u want to remove the plugin , You should try to clean your plugins folder (~/Library/Application Support/Developer/Shared/Xcode/Plug-ins by default) . 

If u want to remove the CodeSnippets , You should try to clean CodeSnippets files in folder (~/Library/Developer/Xcode/UserData/CodeSnippets/) . 


## Usage
I think a good guide line will be helpful for u use the codesnippets.   the UiKit Elements CodeSnippets called with the role:

create + button(without UI prefix) ＝  createButton.

![create uielements](https://github.com/suruiqiang/XcodeSnippet/master/screenshot/create_ui_elements.gif)  


![implement delegate](https://github.com/suruiqiang/XcodeSnippet/master/screenshot/implement_delegate_datasource.gif)  


