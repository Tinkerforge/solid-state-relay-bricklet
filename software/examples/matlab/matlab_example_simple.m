function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletSolidStateRelay;

    HOST = 'localhost';
    PORT = 4223;
    UID = '9y5'; % Change to your UID
    
    ipcon = IPConnection(); % Create IP connection
    ssr = BrickletSolidStateRelay(UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Turn relay on/off for 10 times with 1 second delay
    for i = 1:10
        pause(1);
        if mod(i, 2)
            ssr.setState(true);
        else
            ssr.setState(false);
        end
    end

    input('Press any key to exit...\n', 's');
    ipcon.disconnect();
end
