<#
.SYNOPSIS
    Automated User Onboarding Script for IT Service Desk.
.DESCRIPTION
    Reads a CSV file containing new hire details, generates secure temporary passwords,
    and logs the onboarding process for audit and tracking purposes.
#>

$CsvPath = "./users.csv"
$LogPath = "./onboarding_audit.log"

if (-not (Test-Path $CsvPath)) {
    Write-Host "Грешка: Не е открит файл с нови служители ($CsvPath)!" -ForegroundColor Red
    exit
}

$NewHires = Import-Csv -Path $CsvPath

foreach ($User in $NewHires) {
    $FullName = "$($User.FirstName) $($User.LastName)"
    $Username = "$($User.FirstName.ToLower()).$($User.LastName.ToLower())"
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    $TemporaryPassword = -join ((33..126) | Get-Random -Count 10 | % {[char]$_})

    $LogMessage = "[$Timestamp] SUCCESS: Created account for $FullName ($Username) in Department: $($User.Department) | TempPass: $TemporaryPassword"
    
    Write-Host "Обработка на: $FullName..." -ForegroundColor Cyan
    Write-Host "  -> Потребителско име: $Username" -ForegroundColor Green
    Write-Host "  -> Отдел: $($User.Department)" -ForegroundColor Green

    # Запис на лога във файл (което показва одит и сигурност в предприятието)
    Add-Content -Path $LogPath -Value $LogMessage
}

Write-Host "`nВсички нови служители бяха обработени успешно! Лог файлът е записан в $LogPath" -ForegroundColor Yellow