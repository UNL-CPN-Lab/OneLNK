function stf_snr = calculate_SNR(out_file)
    N = 64;
    sig_idx = 8:2:58;
    header_full = read_complex_binary(out_file);
    header_full = reshape(header_full,N*3,[]);
    data_sig = abs(header_full(sig_idx,:)).^2;
    data_ns = abs(header_full(sig_idx+1,:)).^2;


    stf_snr = 10*log10(sum(data_sig)./sum(data_ns));
    
end
