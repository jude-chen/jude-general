[int]$max = Read-Host -Prompt "Enter the upper limit of the exercises "
[int]$total = Read-Host -Prompt "Enter total number of the questions "
[int]$chance = Read-Host -Prompt "Enter the chance of the showups of the upper limit (1 and above, larger number lower chance) "

$filename = "Addition_${max}_total_${total}.txt"
$i = 1
$output = ""
$null | Out-File $filename -Force

While ($i -le $total) {

    $chance_random = Get-Random -Maximum ($chance+1) -Minimum 1

    Switch ($chance_random) {
        $chance {
            while ($true) {
                $num1 = Get-Random -Maximum $max -Minimum 1
                $num2 = Get-Random -Maximum $max -Minimum 1
                If ($num1 + $num2 -eq $max) {
                    if ($i % 4 -eq 0) {
                        $output += "$num1 + $num2 = `t"
                        Write-Output "$output `r" |Out-File $filename -Append
                        $output = ""
                    }
                    else {
                        $output += "$num1 + $num2 = `t`t"
                    }
                    $i++
                    break
                }
            }
            break

        }
        default {
            while ($true) {
                $num1 = Get-Random -Maximum $max -Minimum 1
                $num2 = Get-Random -Maximum $max -Minimum 1
                If ($num1 + $num2 -le $max) {
                    if ($i % 4 -eq 0) {
                        $output += "$num1 + $num2 = `t"
                        Write-Output "$output `r" |Out-File $filename -Append
                        $output = ""
                    }
                    else {
                        $output += "$num1 + $num2 = `t`t"
                    }
                    $i++
                    break
                }
            }
            break
        }
    }
}