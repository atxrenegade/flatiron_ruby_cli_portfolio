CLI ATOM SHORTCUTS - OBJECT RELATIONSHIPS

MODEL A

Shortcut
	has many:
		descriptions
		MacOSkey
		WindowsKey
		LinuxKey

Description
	belongs to:
		a Shortcut
	has many:
		MacOSkeys through Shortcut
		WindowsKeys through Shortcut
		LinuxKeys through Shortcut

MacOSKey
	belongs to:
		a Shortcut
		a Description through shortcut

WindowsKey
	belongs to:
		a Shortcut
		a Description through shortcut

LinuxKey
	belongs to:
		a Shortcut
		a Description through shortcut


MODEL B

Shortcut
	Has one:
		description
		MacOSkey
		WindowsKey
		LinuxKey

Description
	belongs to:
		a Shortcut
	has a
		MacOSkey through shortcut
		WindowsKeysthrough shortcut
		LinuxKey through shortcut

MacOSKey
	belongs to:
		a Shortcut
		a Description through shortcut

WindowsKey
	belongs to:
		a Shortcut
		a Description through shortcut


LinuxKey
	belongs to:
		a Shortcut
		a Description through shortcut

MODEL C *** (chosen structure)

Shortcut
	has one:
		description
		MacOSkey
		WindowsKey
		LinuxKey

Description
	belongs to:
		a Shortcut
	has one:
		MacOSkey
		WindowsKey
		LinuxKey

MacOSKey
	belongs to:
		a Shortcut
		a Description

WindowsKey
	belongs to:
		a Shortcut
		a Description

LinuxKey
	belongs to:
		a Shortcut
		a Description
