function PSD = calculate_RSS(out_file)
    %c = -100.999;
    c = -123.5;
    sample_rate=5e6;
    N = 64;
    R = 45;
    N_cp=16;  
    delta_t=(N+N_cp)/sample_rate;

    out_rx = read_complex_binary(out_file);
    out_rx = out_rx(1:end-mod(length(out_rx),N*R));
    out_rx = reshape(out_rx,N*R,[]);

    PSD = (10*log10(sum(real(out_rx).^2+imag(out_rx).^2)/delta_t))+c;
    
end
