# Tweaks-for-Gaming.bat

Credits goes to many people, i can just say the most memorable/important ones cause they are many: 
Melody, Dreammjow, Calypto, Danske, Revision discord, LAG discord.. I probably forgot important names.. sorrys

Please dont fuck me copying and changing title, and even worse selling this..
People that buys shitty usually have bad bios settings and other problems like 8gb max ram etc etc..
Doing some tweaks that i have like disabling power service would just FUCK their systems stability.
The whole file is open-source, thats my DEFENSE against anything that could possibly go wrong on your pc.
Remember, this is a POST-INSTALL that works on MY PC!
I just tried to made more compatible with others pcs and shared.
You are free to edit or cut anything on file and use as you want.

JUST FOLLOW THE RULE TO NOT SELL TWEAKS.
SELL IS BAD. But if you want donate, motivates me continuate this.. 
bit.ly/3goAOyc for paypal and any 1$ is valuable enough to me to be happy.

Thats whats the script does:
- enables winmgmt,trustedinstaller,appinfo,deviceinstall before running everything
- unrestricts execution policy in powershell
- blocks dotnet telemetry
- disables win defender
- disables win update
- removes image file executions
- removes kernel blacklists
- removes hosts file
- install .net 4.8
- install directx
- install vulkan
- install vcredist
- install google chrome and configure it
- install discord and configure it
- install a better version of 7zip and configure it
- install notepad++ and configure it
- enables win components
- enables al hrtf
- enables msi for gpu
- remove any threadpriority dword
- set 0 to any iolatencycap dword
- disables hipm and dipm
- disables any cdpusersvc
- removes adapters off qos service
- disables qos and ndiscap
- fixes teredo
- fixes netbt
- disables usb idling
- disables storport idling
- install aero lite but dont set it
- configure settings based on %number_of_processors%
- automatically configure all tcpoptimizer settings
- automatically configure all ethernet adapter settings
- disables not necessary adapter bindings
- disables drivers, big list but most from adams list
- sets a clean version of bcd params
- disables a bunch of security and mitigation stuff
- fixes and improves memory (leaks and stutters)
- disables FSO for win10
- disables lua completly
- sets win32ps
- adds a very basic list of ghidra dwords, i removed all LatencyTolerance or latency dwords..
- disables timer coalescing that is energy-saving technique
and makes questions, for do actions based on your choice..
