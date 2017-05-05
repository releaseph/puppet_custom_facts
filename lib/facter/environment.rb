environments = [ /(dev)/i, /(uat)/i, /(test-deploy)/i, /(testdeploy)/i, /(staging)/i ]

environments_regex = Regexp.union(environments)
if Facter.value(:hostname).match(environments_regex)
    if ($1 == 'test-deploy') || ($1 == 'testdeploy')
        Facter.add('puppet_env') do
            setcode do
                'testdeploy'
            end
        end
    else
        Facter.add('puppet_env') do
            setcode do
                $1
            end
        end
    end
else
    Facter.add('puppet_env') do
        setcode do
            'live'
        end
    end
end
