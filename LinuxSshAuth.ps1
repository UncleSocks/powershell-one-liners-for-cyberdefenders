Select-String -Path ".\messages_sample.txt" -Pattern "(?<status>accepted|failed)\s(?<method>publickey|password)\sfor\s(?<user>[a-zA-Z_\-0-9]+)" -AllMatches | ForEach-Object { $_.Matches | ForEach-Object { $status=$_.Groups['status'].Value; $method=$_.Groups['method'].Value; $user=$_.Groups['user'].Value }; [PSCustomObject]@{Status=$status;Method=$method;User=$user} } | Format-Table -AutoSize