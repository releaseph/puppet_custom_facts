if Facter.value(:hostname).match(/(dev|uat|test-deploy|testdeploy|staging)/i)
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