#How to run
- go to repo directory in powershell and call scripts with .\*name*

#Quality assurance
For this repo we used PSScriptAnalyzer which can be found at:
https://github.com/PowerShell/PSScriptAnalyzer .

- linting:
    - download PSScriptAnalyzer from link above
    - run "Invoke-ScriptAnalyzer .\*.ps1" without quotes
    - There will be one warning as a result (PSScriptAnalyzer 1.16.1).
      This warning is wrong so it can be ignored.
