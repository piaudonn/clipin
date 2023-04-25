function clipin ($path)
{
    If ( (Test-Path $path) -eq $true )
    {
        $dest = (Get-Location).Path + "$path.zip"
        Compress-Archive -Path $path -CompressionLevel Optimal -DestinationPath $dest -Update
        $data = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($dest))
        $inject =  "Add-Type -AssemblyName System.Windows.Forms`n"
        $inject += "`$temp = (New-TemporaryFile).FullName`n"
        $inject += "[System.IO.File]::WriteAllBytes(""`$temp"", [System.Convert]::FromBase64String(""$data""))`n"
        $inject += "Add-Type -AssemblyName System.IO.Compression.FileSystem`n"
        $inject += "[System.IO.Compression.ZipFile]::ExtractToDirectory(""`$temp"",(Get-Location).Path)`n"
        Set-Clipboard $inject
    } Else {
        throw "Path does not exist!"
    }
}
