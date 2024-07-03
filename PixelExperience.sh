import subprocess

# List of Google packages to be removed
google_bloat = [
    "com.google.android.googlequicksearchbox", # Google Search
    "com.google.android.gm", # Gmail
    "com.google.android.apps.maps", # Google Maps
    "com.google.android.youtube", # YouTube
    "com.google.android.apps.docs", # Google Drive
    "com.google.android.music", # Google Play Music
    "com.google.android.videos", # Google Play Movies & TV
    "com.google.android.apps.accessibility.voiceaccess" #Voice Access 
    "com.google.android.calendar", # Google Calendar
    "com.google.android.keep", # Google Keep
    "com.google.android.projection.gearhead" # Android Auto
    "com.google.android.apps.tachyon", # Google Duo
    "com.google.android.apps.translate", # Google Translate
    "com.google.android.apps.magazines", # Google News
    "com.google.android.apps.fitness", # Google Fit
    "com.google.android.apps.googleassistant", # Google Assistant
    "com.google.earth", # Google Earth
    "com.google.android.apps.turbo", # Device Health
    "com.google.android.apps.safetyhub", # Personal Safety
    "com.google.android.marvin.talkback" #Android Accessibility Suite
    "com.google.android.apps.classroom", # Google Classroom
    "com.google.android.apps.books", # Google Play Books
    "com.google.android.apps.authenticator2", # Google Authenticator
    "com.google.android.apps.podcasts", # Google Podcasts
    "com.google.android.apps.chromecast.app", # Google Home
    "com.google.android.apps.googlevoice", # Google Voice
    "com.google.android.apps.tasks", # Google Tasks
    "com.google.android.street", # Google Street View
    "com.google.android.apps.subscriptions.red", # Google One
    "com.google.android.apps.docs.editors.sheets", # Google Sheets
    "com.google.android.apps.cultural", # Google Arts & Culture
    "com.google.android.apps.travel.onthego", # Google Trips
    "com.google.android.apps.tycho", # Google Fi
    "com.google.android.apps.kids.familylink", # Google Family Link
    "com.google.android.apps.cloudconsole", # Google Cloud Console
    "com.google.android.apps.vega", # Google My Business
    "com.google.android.apps.ads.publisher", # Google AdSense
    "com.google.android.apps.adwords", # Google AdWords
    "com.google.android.apps.giant", # Google Analytics
    "com.google.android.apps.paidtasks", # Google Opinion Rewards
    "com.google.android.apps.gesturesearch", # Google Gesture Search
    "com.google.android.apps.shopping.express", # Google Shopping
    "com.google.vr.expeditions", # Google Expeditions
    "com.google.android.apps.accessibility.auditor", # Google Accessibility Scanner
    "com.google.android.apps.bard" # Gemini
]

# Additional system packages to be removed
system_bloat = [
    "com.android.dreams.basic", # Basic Dream (Screensaver)
    "org.evolutionx.papers", # EvoX Papers
    "com.android.dreams.phototable", # Photo Table (Screensaver)
    "com.android.hotwordenrollment.okgoogle", # Hotword Enrollment for OK Google
    "com.android.printspooler", # Print Spooler
    "com.android.wallpaper.livepicker" # Live Wallpaper Picker
]

# Combine both lists
all_bloat = google_bloat + system_bloat

# Function to generate ADB shell commands to uninstall packages
def generate_uninstall_commands(packages):
    uninstall_commands = []
    for package in packages:
        uninstall_commands.append(f'adb shell pm uninstall -k --user 0 {package}')
    return uninstall_commands

# Function to execute ADB shell commands and print result
def execute_commands(commands):
    for command in commands:
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        package_name = command.split()[-1]
        if 'Success' in result.stdout:
            print(f"Successfully uninstalled {package_name}")
        else:
            print(f"Failed to uninstall {package_name}: {result.stdout.strip()}")

# Function to get the list of installed packages
def get_installed_packages():
    result = subprocess.run(["adb", "shell", "pm", "list", "packages"], capture_output=True, text=True)
    packages = result.stdout.splitlines()
    # Remove the 'package:' prefix
    packages = [pkg.replace("package:", "") for pkg in packages]
    return packages

# Get the list of installed packages
installed_packages = get_installed_packages()

# Filter the list of bloatware to only those that are installed
bloatware_to_uninstall = [pkg for pkg in all_bloat if pkg in installed_packages]

# Generate uninstall commands for the installed bloatware
uninstall_commands = generate_uninstall_commands(bloatware_to_uninstall)

# Execute uninstall commands
execute_commands(uninstall_commands)

print("Debloating PixelExperience complete.")

