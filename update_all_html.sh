#!/bin/bash

# Navigate to docs directory
cd docs

# Loop through all HTML files except those already updated
for file in blog.html careers.html demo.html privacy.html services.html team.html terms.html; do
  # Check if the file doesn't already have mobile.css
  if ! grep -q "mobile.css" "$file"; then
    echo "Updating $file..."
    # Insert the mobile CSS link after the AOS CSS link
    sed -i '' 's/<link href="https:\/\/unpkg.com\/aos@2.3.1\/dist\/aos.css" rel="stylesheet">/<link href="https:\/\/unpkg.com\/aos@2.3.1\/dist\/aos.css" rel="stylesheet">\n    <!-- Mobile responsiveness -->\n    <link href="css\/mobile.css" rel="stylesheet">/' "$file"
    
    # Make navbar sticky-top
    sed -i '' 's/<nav class="navbar navbar-expand-lg navbar-light bg-white">/<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">/' "$file"
    
    # Add overflow-x: hidden to body
    sed -i '' 's/line-height: 1.5;/line-height: 1.5;\n            overflow-x: hidden;/' "$file"
    
    # Update AOS.init to disable on mobile
    sed -i '' 's/once: true/once: true,\n            disable: window.innerWidth < 768 \/\/ Disable animations on mobile for better performance/' "$file"
  fi
done

echo "All HTML files have been updated!" 