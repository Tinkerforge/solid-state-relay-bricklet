Imports Tinkerforge

Module ExampleSimple
    Const HOST As String = "localhost"
    Const PORT As Integer = 4223
    Const UID As String = "XYZ" ' Change to your UID

    Sub Main()
        Dim ipcon As New IPConnection() ' Create IP connection
        Dim ssr As New BrickletSolidStateRelay(UID, ipcon) ' Create device object

        ipcon.Connect(HOST, PORT) ' Connect to brickd
        ' Don't use device before ipcon is connected

        ' Turn relay on/off for 10 times with 1 second delay
        Dim i As Integer

        For i = 1 To 10
            System.Threading.Thread.Sleep(1000)

            If i Mod 2 = 0 Then
                ssr.SetState(True)
            Else
                ssr.SetState(False)
            End If
        Next i

        System.Console.WriteLine("Press key to exit")
        System.Console.ReadLine()
        ipcon.Disconnect()
    End Sub
End Module
