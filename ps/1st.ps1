# PowerShell Script: Create Mobile App for Xerion Wheelo using React Native and TypeScript

# Define project directory
$projectDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionclient"

# Check if Expo CLI is installed
if (-not (Get-Command "expo" -ErrorAction SilentlyContinue)) {
    Write-Host "Expo CLI not found. Installing it globally..." -ForegroundColor Yellow
    npm install -g expo-cli
}

# Create a new React Native project with TypeScript template
Write-Host "Creating React Native project with TypeScript..." -ForegroundColor Green
npx create-expo-app $projectDir --template typescript

# Navigate to the project directory
Set-Location -Path $projectDir

# Install additional dependencies (example: React Navigation)
Write-Host "Installing additional dependencies (React Navigation, Axios)..." -ForegroundColor Green
npm install @react-navigation/native @react-navigation/stack react-native-screens react-native-safe-area-context react-native-gesture-handler react-native-reanimated axios

# Configure TypeScript base settings
Write-Host "Configuring TypeScript settings..." -ForegroundColor Green
Set-Content -Path "$projectDir\tsconfig.json" -Value @"
{
  "compilerOptions": {
    "target": "esnext",
    "module": "esnext",
    "jsx": "react-native",
    "strict": true,
    "noImplicitAny": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "resolveJsonModule": true,
    "baseUrl": "./",
    "paths": {
      "@/*": ["src/*"]
    }
  },
  "include": ["src/**/*", "index.ts"]
}
"@

# Create project structure
Write-Host "Creating project folder structure..." -ForegroundColor Green
New-Item -ItemType Directory -Force -Path "$projectDir\src"
New-Item -ItemType Directory -Force -Path "$projectDir\src\components"
New-Item -ItemType Directory -Force -Path "$projectDir\src\navigation"
New-Item -ItemType Directory -Force -Path "$projectDir\src\screens"
New-Item -ItemType Directory -Force -Path "$projectDir\src\services"
New-Item -ItemType Directory -Force -Path "$projectDir\src\styles"
New-Item -ItemType Directory -Force -Path "$projectDir\src\assets"

# Create App.tsx
Write-Host "Creating App.tsx..." -ForegroundColor Green
Set-Content -Path "$projectDir\App.tsx" -Value @"
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import HomeScreen from './src/screens/HomeScreen';

const Stack = createStackNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name="Home" component={HomeScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
"@

# Create HomeScreen.tsx
Write-Host "Creating HomeScreen component..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\screens\HomeScreen.tsx" -Value @"
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const HomeScreen = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Welcome to Xerion Wheelo!</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f0f0f0',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
  },
});

export default HomeScreen;
"@

# Create a basic service
Write-Host "Creating example service..." -ForegroundColor Green
Set-Content -Path "$projectDir\src\services\ApiService.ts" -Value @"
import axios from 'axios';

const ApiService = axios.create({
  baseURL: 'https://api.example.com',
  timeout: 10000,
});

export default ApiService;
"@

# Output success message
Write-Host "React Native application initialized successfully at $projectDir" -ForegroundColor Green
Write-Host "Navigate to the project directory and start the app with 'npm start' or 'expo start'." -ForegroundColor Cyan
