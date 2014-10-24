# PRLHotKeyKit

## Description

An objective-c framework to handle hotkeys (global keyboard shortcuts) in OS X 10.9 or later.

I started this project after searching for a convenient framework or set of classes to handle storage of hotkeys, a text field, and tableview cell that could display them properly. After coming up short, I decided to write one.

## Contents

### PRLHotKeyKit (outer folder)

The folder containing the framework and sample application projects.

### PRLHotKey Demo

A sample application to show the capabilities. Run the project, enter a hotkey in the text field. Close the window and switch to another application. Press the hotkey to come back to the sample application.

### PRLHotKeyKit

The project that builds the following classes into a framework.

#### PRLHotKey

The model class - stores the hotkey and provides utility classes for conversion to strings and vice versa.

#### PRLHotKeyFieldCell

A subclass of NSTextFieldCell that can be used in NSTextFields and in place of NSTableViewCells to handle insertion and display of hot keys.

#### PRLHotKeyFieldEditor

The field editor used by PRLHotKeyFieldCell. If you use PRLHotKeyFieldCell you shouldn't need to use this directly. You may need this if you are building your own controls.

## License

Released under the Modified BSD License. (Attribution Required)

PRLHotKeyKit & PRLHotKey Demo

Copyright (c) 2014 Parliant Corporation. All rights reserved.
<pre>
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
3. The name of the author may not be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
</pre>