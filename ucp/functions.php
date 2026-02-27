<?php
function hashit($salt, $password) {
    // In SAMP, MD5_Hash typically returns uppercase hex.
    // The logic in GM.pwn is:
    // 1. Concat MD5(salt) and MD5(pass)
    // 2. Lowercase the result
    // 3. MD5 the result
    // 4. Lowercase the result
    
    // Since PHP's md5() returns lowercase hex by default:
    // 1. md5($salt) . md5($password) gives us the lowercased concatenation directly.
    // 2. md5(...) of that gives us the final hash in lowercase.
    
    return md5(md5($salt) . md5($password));
}

function cleanInput($data) { 
    global $conn;
    return mysqli_real_escape_string($conn, htmlspecialchars(strip_tags(trim($data))));
}
?>