Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2019; Day 1              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

Set-Location $PSScriptRoot

$input = "day1input.txt"

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow

$total = 0

Get-Content $input | ForEach-Object {
    $fuel = ([math]::floor([decimal]$_ / 3) -2)
    $total += $fuel
}

Write-Host "Total: $total" -ForegroundColor Green


Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow

$total = 0

Get-Content $input | ForEach-Object {
    $fuel = ([math]::floor([decimal]$_ / 3) -2)
    while ($fuel -ge 0) {
        $total += $fuel
        $fuel = ([math]::floor([decimal]$fuel / 3) -2)
    }
}

Write-Host "Total: $total" -ForegroundColor Green