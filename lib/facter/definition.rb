Facter.add(:definition) do
  setcode do
    Facter.value(:hostname) == 'master.loc'
  end
end
