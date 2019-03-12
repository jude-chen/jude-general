$max = Read-Host -Prompt "Enter the range: "
$total = Read-Host -Prompt "Enter total: "

$filename = "Addition_${max}_total_${total}.txt"
$i = 1
$output = ""
$null | Out-File $filename -Force

While ($i -le $total) {

    $chance = Get-Random -Maximum 5 -Minimum 1

    Switch ($chance) {
        4 {
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