require_relative "verifiers/email_verifier.rb"

verifier = EmailVerifier.new

while line = $stdio.gets
  $stdout.puts(verifier.execute(line.chomp()) ? 'ok' : 'ng')
end
