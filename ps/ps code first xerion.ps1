# Define output directory for models
$outputDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Models\"

# Ensure the output directory exists
if (-Not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Force -Path $outputDir
}

# Define SQL script file path
$sqlFilePath = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\SQL\xerion.sql"

# Read the SQL script content
$sqlContent = Get-Content -Path $sqlFilePath

# Function to generate C# class for a table
function Generate-CSharpClass {
    param (
        [string]$tableName,
        [array]$columns
    )

    # Start the class definition
    $classContent = @"
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xerion.Backend.Models
{
    public class $tableName
    {
"@

    # Add properties for each column
    foreach ($column in $columns) {
        $columnName = $column.Name
        $columnType = $column.Type
        $isNullable = $column.IsNullable

        # Map SQL type to C# type
        switch ($columnType.ToLower()) {
            "int" { $csType = "int" }
            "serial" { $csType = "int" }
            "varchar" { $csType = "string" }
            "text" { $csType = "string" }
            "decimal" { $csType = "decimal" }
            "date" { $csType = "DateTime" }
            default { $csType = "string" }
        }

        if ($isNullable -and $csType -ne "string") {
            $csType += "?"
        }

        # Add property
        $classContent += "        public $csType $columnName { get; set; }\n"
    }

    # Close the class
    $classContent += "    }\n}\n"

    return $classContent
}

# Function to parse table definitions from SQL
function Parse-SQLTables {

Write-Host "Parse-SQLTables"

    param (
        [string]$sqlContent
    )

    $tables = @()
    $currentTable = $null
    $currentColumns = @()

    foreach ($line in $sqlContent) {
        if ($line -match "^CREATE TABLE (\w+)") {
            if ($currentTable -ne $null) {
                $tables += @{ Name = $currentTable; Columns = $currentColumns }
            }
            $currentTable = $matches[1]

Write-Host "Got sql for table: $currentTable" -ForegroundColor Green

            $currentColumns = @()
        } elseif ($line -match "^\s*(\w+)\s+(\w+)( NULL| NOT NULL)?") {
            $columnName = $matches[1]
            $columnType = $matches[2]
            $isNullable = $matches[3] -eq " NULL"
            $currentColumns += @{ Name = $columnName; Type = $columnType; IsNullable = $isNullable }
        }
    }

    if ($currentTable -ne $null) {
        $tables += @{ Name = $currentTable; Columns = $currentColumns }
    }

    return $tables
}

# Parse tables from SQL content
$tables = Parse-SQLTables -sqlContent $sqlContent

# Generate C# classes for each table
foreach ($table in $tables) {
    $className = $table.Name
    $columns = $table.Columns

    Write-Host "Generating class for table: $className" -ForegroundColor Green

    $classContent = Generate-CSharpClass -tableName $className -columns $columns

    $classFilePath = Join-Path $outputDir "$className.cs"
    Set-Content -Path $classFilePath -Value $classContent
}

# Output completion message
Write-Host "C# classes generated successfully in $outputDir" -ForegroundColor Cyan
