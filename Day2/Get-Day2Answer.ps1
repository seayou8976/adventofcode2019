Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green
Write-Host "+             Advent of Code 2019; Day 1              +" -ForegroundColor Green
Write-Host "+++++++++++++++++++++++++++++++++++++++++++++++++++++++" -ForegroundColor Green

Set-Location $PSScriptRoot

$input = "day2input.txt"

Write-Host "++++++ Part 1 ++++++" -ForegroundColor Yellow

[int[]]$op = ((Get-Content $input) -split ',')
$op.Item(1) = 12
$op.Item(2) = 2

:intcode for ($i = 0; $i -lt ($($op).count); $i += 4) {
    switch ($op[$i]) {
        1 { $op.Item($op[$i + 3]) = (($op[$op[$i + 1]]) + ($op[$op[$i + 2]])) }
        2 { $op.Item($op[$i + 3]) = (($op[$op[$i + 1]]) * ($op[$op[$i + 2]])) }
        99 { Break intcode }
    }
}

Write-Host "Position 0: $($op[0])" -ForegroundColor Green

Write-Host "++++++ Part 2 ++++++" -ForegroundColor Yellow

[int[]]$op = ((Get-Content $input) -split ',')

:part2 for ($x = 0; $x -le 99; $x++) {
    for ($y = 0; $y -le 99; $y++) {
        $op.Item(1) = $x
        $op.Item(2) = $y
        :intcode for ($i = 0; $i -lt ($($op).count); $i += 4) {
            switch ($op[$i]) {
                1 { $op.Item($op[$i + 3]) = (($op[$op[$i + 1]]) + ($op[$op[$i + 2]])) }
                2 { $op.Item($op[$i + 3]) = (($op[$op[$i + 1]]) * ($op[$op[$i + 2]])) }
                99 { Break intcode }
            }
        }
        if ($op[0] -eq 19690720) {
            Break part2
        } else {
            [int[]]$op = ((Get-Content $input) -split ',')
        }
    }
}

Write-Host "Noun: $x Verb: $y" -ForegroundColor Green
Write-Host "Answer: $(100 * $x + $y)" -ForegroundColor Green