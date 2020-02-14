$eodfiledir = "\\shptfssapp1\d$\Spectrum\Logs\EOD"
$eodfssbatchdir = "\\shptfssapp1\Spectrum\Logs\FSS.Reporting.BatchStatementUtility"
$eoddailydir = "\\shptfssapp1\spectrum\statements\daily"
$eodreportsdir = "\\shptfssapp1\spectrum\Reports"
$eodemirdir = "\\shptfssapp1\spectrum\Reports\EMIR"
$eodstbfilesdir = "\\shptfssapp1\Spectrum\Reports\stbfiles"
$eodglobalriskdir = "\\shptfssapp1\Spectrum\Reports\GlobalRisk"
$eodaccountsdir = "\\shptfssapp1\Spectrum\Reports\Accounts"
$eodmarginsdir = "\\shptfssapp1\Spectrum\Reports\Margins"
$eodalgodir = "\\shptfssapp1\Spectrum\Reports\ALGO\"
$eodpsoftdir = "\\shptfssapp1\Spectrum\Reports\peoplesoft"  


if (Test-Path -path $eodfiledir)


 {


$filter = "EOD-2020*"
$latest = Get-ChildItem -Path $eodfiledir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Write-Output "*********************"
Write-Output "BEGIN EOD FILE CHECK"
Write-Output ""
Write-Output (-join("Folder path: " + $eodfiledir))
Write-Output (-join($latest.name, " was last modified on:"))
Write-Output $latest.LastWriteTime;
Write-Output ""

}


else 
{

Write-Output "FILE DOES NOT EXIST"

}


if (Test-Path -path $eodfssbatchdir) {

Write-Output "*********************************"
Write-Output "BEGIN BATCH STATEMENT FILE CHECK"
Write-Output "*********************************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodfssbatchdir))

Get-Content $eodfssbatchdir\Reporting.BatchStatementUtility.log -Tail 1
Write-Output ""
}


else 
{

Write-Output "FILE DOES NOT EXIST"

}

if (Test-Path -path $eoddailydir) {


Write-Output "*******************************************"
Write-Output "BEGIN DAILY STMNT FILE COUNT AND PDF CHECK"
Write-Output "*******************************************"

$check = Get-ChildItem -Path $eoddailydir | Sort-Object LastWriteTime -Descending | Select-Object -First 1
Write-Output (-join("The last date folder is:  " + $check.FullName + " and it contains " + (dir $eoddailydir\$check | Measure-Object).Count + " files"))


$pdffilter = Get-ChildItem $check.FullName -Recurse -Filter '*.pdf' | Measure-Object 

Write-Output ""
Write-Output (-join("There are " + $pdffilter.Count + " .PDF files" + " Call support if this number is less or more than " + $pdffilter.Count))
Write-Output ""
}

if (Test-Path -path $eodreportsdir)


 {


$filter1 = "AlgoPositions2020*"
$filter2 = "FSS_EOD_RATES2020*"
$latest1 = Get-ChildItem -Path $eodreportsdir -Filter $filter1 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest2 = Get-ChildItem -Path $eodreportsdir -Filter $filter2 | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Write-Output "************************************************"
Write-Output "BEGIN REPORTS (ALGO & FSS EOD RATES) FILE CHECK"
Write-Output "************************************************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodreportsdir))
Write-Output (-join($latest1.name, " was last modified on:"))
Write-Output $latest1.LastWriteTime;
Write-Output ""

Write-Output (-join("Folder path: " + $eodreportsdir))
Write-Output (-join($latest2.name, " was last modified on:"))
Write-Output $latest2.LastWriteTime;
Write-Output ""


}


else 
{

Write-Output "FILE DOES NOT EXIST"

}

if (Test-Path -path $eodemirdir)


 {


$filter1 = "UnaVista_EMIR_Daily_Val_2020*"
$filter2 = "UnaVista_EMIR_Daily_2020*"
$latest1 = Get-ChildItem -Path $eodemirdir -Filter $filter1 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest2 = Get-ChildItem -Path $eodemirdir -Filter $filter2 | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Write-Output "************************************************"
Write-Output "BEGIN EMIR FILE CHECKS"
Write-Output "************************************************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodemirdir))
Write-Output (-join($latest1.name, " was last modified on:"))
Write-Output $latest1.LastWriteTime;
Write-Output ""

Write-Output (-join("Folder path: " + $eodemirdir))
Write-Output (-join($latest2.name, " was last modified on:"))
Write-Output $latest2.LastWriteTime;
Write-Output ""


}


else 
{

Write-Output "FILE DOES NOT EXIST"

}



if (Test-Path -path $eodstbfilesdir)


 {


$filter1 = "FSSCashBal2020*"
$filter2 = "FSSOpPosn2020*"
$latest1 = Get-ChildItem -Path $eodstbfilesdir -Filter $filter1 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest2 = Get-ChildItem -Path $eodstbfilesdir -Filter $filter2 | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Write-Output "*********************"
Write-Output "BEGIN STBFILES CHECK"
Write-Output "*********************"

Write-Output (-join("Folder path: " + $eodstbfilesdir))
Write-Output (-join($latest1.name, " was last modified on:"))
Write-Output $latest1.LastWriteTime;
Write-Output ""

Write-Output (-join("Folder path: " + $eodstbfilesdir))
Write-Output (-join($latest2.name, " was last modified on:"))
Write-Output $latest2.LastWriteTime;
Write-Output ""

}


else 
{

Write-Output "FILE DOES NOT EXIST"

}

if (Test-Path -path $eodglobalriskdir)


 {


$filter = "FSSOpPosn2020*"
$latest = Get-ChildItem -Path $eodglobalriskdir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Write-Output "*****************************"
Write-Output "BEGIN GLOBAL RISK FILE CHECK"
Write-Output "*****************************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodglobalriskdir))
Write-Output (-join($latest.name, " was last modified on:"))
Write-Output $latest.LastWriteTime;
Write-Output ""

}


else 
{

Write-Output "FILE DOES NOT EXIST"

}


if (Test-Path -path $eodaccountsdir)


 {

$filter1 = "FutLonAllOpenTrades2020*"
$filter2 = "FutLonCurrentTrade2020*"
$filter3 = "SFGenCurrenttrade2020*"
$filter4 = "SFGenAllOpenTrades2020*"
$filter5 = "SFLonCurrenttrade2020*"
$filter6 = "SFLonAllOpenTrades2020*"

$latest1 = Get-ChildItem -Path $eodaccountsdir -Filter $filter1 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest2 = Get-ChildItem -Path $eodaccountsdir -Filter $filter2 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest3 = Get-ChildItem -Path $eodaccountsdir -Filter $filter3 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest4 = Get-ChildItem -Path $eodaccountsdir -Filter $filter4 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest5 = Get-ChildItem -Path $eodaccountsdir -Filter $filter5 | Sort-Object LastAccessTime -Descending | Select-Object -First 1
$latest6 = Get-ChildItem -Path $eodaccountsdir -Filter $filter6 | Sort-Object LastAccessTime -Descending | Select-Object -First 1


Write-Output "*****************************"
Write-Output "BEGIN GLOBAL RISK FILE CHECK"
Write-Output "*****************************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodaccountsdir))
Write-Output (-join($latest1.name, " was last modified on:"))
Write-Output $latest1.LastWriteTime;
Write-Output ""

Write-Output (-join("Folder path: " + $eodaccountsdir))
Write-Output (-join($latest2.name, " was last modified on:"))
Write-Output $latest2.LastWriteTime;
Write-Output ""


Write-Output (-join("Folder path: " + $eodaccountsdir))
Write-Output (-join($latest3.name, " was last modified on:"))
Write-Output $latest3.LastWriteTime;
Write-Output ""


Write-Output (-join("Folder path: " + $eodaccountsdir))
Write-Output (-join($latest4.name, " was last modified on:"))
Write-Output $latest4.LastWriteTime;
Write-Output ""


Write-Output (-join("Folder path: " + $eodaccountsdir))
Write-Output (-join($latest5.name, " was last modified on:"))
Write-Output $latest5.LastWriteTime;
Write-Output ""


Write-Output (-join("Folder path: " + $eodaccountsdir))
Write-Output (-join($latest6.name, " was last modified on:"))
Write-Output $latest6.LastWriteTime;
Write-Output ""


}


else 
{

Write-Output "FILE DOES NOT EXIST"

}


if (Test-Path -path $eodmarginsdir)


 {

$filter1 = "*070*"
$filter2 = "*080*"
$filter3 = "*110*"

$latest1 = Get-ChildItem -Path $eodmarginsdir -Filter $filter1 | Sort-Object LastAccessTime  -Descending | Select-Object -First 1
$latest2 = Get-ChildItem -Path $eodmarginsdir -Filter $filter2 | Sort-Object LastAccessTime  -Descending | Select-Object -First 1
$latest3 = Get-ChildItem -Path $eodmarginsdir -Filter $filter3 | Sort-Object LastAccessTime  -Descending | Select-Object -First 1

Write-Output "*********************"
Write-Output "BEGIN MARGINS FILE CHECK"
Write-Output "*********************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodmarginsdir))
Write-Output (-join($latest1.name, " was last modified on:"))
Write-Output $latest1.LastWriteTime;
Write-Output ""

Write-Output (-join("Folder path: " + $eodmarginsdir))
Write-Output (-join($latest2.name, " was last modified on:"))
Write-Output $latest2.LastWriteTime;
Write-Output ""

Write-Output (-join("Folder path: " + $eodmarginsdir))
Write-Output (-join($latest3.name, " was last modified on:"))
Write-Output $latest3.LastWriteTime;
Write-Output ""


}


else 
{

Write-Output "FILE DOES NOT EXIST"

}

if (Test-Path -path $eodalgodir)


 {


$filter = "AlgoOTC2020*"
$latest = Get-ChildItem -Path $eodalgodir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Write-Output "*********************"
Write-Output "BEGIN ALGO FILE CHECK"
Write-Output "*********************"
Write-Output ""
Write-Output (-join("Folder path: " + $eodalgodir))
Write-Output (-join($latest.name, " was last modified on:"))
Write-Output $latest.LastWriteTime;
Write-Output ""

}


else 
{

Write-Output "FILE DOES NOT EXIST"

}


if (Test-Path -path $eodpsoftdir)


 {


$filter = "PSEXPORT9-2020*"
$latest = Get-ChildItem -Path $eodpsoftdir -Filter $filter | Sort-Object LastAccessTime -Descending | Select-Object -First 2

Write-Output "****************************"
Write-Output "BEGIN PEOPLESOFT FILE CHECK"
Write-Output "****************************"
Write-Output $latest
Write-Output ""

}


else 
{

Write-Output "FILE DOES NOT EXIST"

}



