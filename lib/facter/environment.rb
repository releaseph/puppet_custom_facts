environments = [ 
    /(dev)/i,
    /(uat)/i,
    /(test-deploy)/i,
    /(testdeploy)/i,
    /(staging)/i
]

environments_regex = Regexp.union(environments)
if Facter.value(:hostname).match(environments_regex)
    Facter.add('puppet_env') do
        setcode do
            $1
        end
    end
end
