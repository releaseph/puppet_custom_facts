roles = [
    /(cjo)(?:[0-9]|[-])/i,
    /(stahl)(?:[0-9]|[-])/i,
]
environments = [ /(dev)/i, /(uat)/i, /(test-deploy)/i, /(testdeploy)/i, /(staging)/i ]

roles_regex = Regexp.union(roles)
if Facter.value(:hostname).match(roles_regex)
    Facter.add('puppet_role') do
        setcode do
            $1
        end
    end
end

environments_regex = Regexp.union(environments)
if Facter.value(:hostname).match(environments_regex)
    Facter.add('puppet_env') do
        setcode do
            $1
        end
    end
end
