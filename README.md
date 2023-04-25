### 📎 Proof of concept to copy files over RDP connections

This is a proof of concept to demonstrate that as long as you have your clipboard enabled over RDP, you can do things, even if some of the features have been disabled. This is only to demonstrate the limits of such protections.

Some RDP clients/host are blocking the ability to copy/paste files over the RDP connection. In some cases, they have not disable the clipboard entirely but only restricted what can be used through it (see [[MS-RDPECLIP]](https://learn.microsoft.com/en-us/openspecs/windows_protocols/MS-RDPECLIP/fb9b7e0b-6db4-41c2-b83c-f889c1ee7688) I guess).

The clipin function is doing the following on the target server (where the file is):
1. Takes a path in input.
2. Zips it (works with a file or a folder).
3. Turns in into a base64 string.
4. Puts that string instead of the file into the clipboard (along with the PowerShell code to convert it back)

Then on the client (where you want to copy the file to):
1. Open a PowerShell console and just paste what you have in your clipboard

Here is a video to demo the usage:

https://user-images.githubusercontent.com/22434561/234328728-6c08a4ba-d575-40b9-8898-0e5e23e1bbf4.mp4

