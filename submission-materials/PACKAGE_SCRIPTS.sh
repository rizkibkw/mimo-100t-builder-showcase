#!/bin/bash
################################################################################
# ThemeForest Package Creation Script
# Creates properly structured ZIP packages for ThemeForest submission
################################################################################

# Configuration
SOURCE_DIR="/usr/share/nginx/html/landpage"
OUTPUT_DIR="/root/themeforest_submission/packages"
SUBMISSION_DIR="/root/themeforest_submission"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Product definitions
declare -a PRODUCTS=(
    "01-codefine-saas:01-saas-nexus.html:Codefine SaaS Nexus"
    "02-apex-agency:02-agency-apex.html:Apex Agency"
    "03-vaultex-defi:03-crypto-vaultex.html:Vaultex DeFi"
    "04-devport-devtool:04-devtool-devport.html:Devport DevTool"
    "05-lumina-ecom:05-ecom-storefront.html:Lumina E-Com"
)

echo "=========================================="
echo "ThemeForest Package Creation Script"
echo "=========================================="
echo ""

# Create README.txt template
create_readme() {
    local product_name="$1"
    local product_id="$2"
    local html_file="$3"
    
    cat > README.txt << EOF
================================================================================
$product_name - Installation & Documentation
================================================================================

VERSION: 1.0.0
AUTHOR: ThemeForest Submitter

--------------------------------------------------------------------------------
PRODUCT OVERVIEW
--------------------------------------------------------------------------------
Thank you for purchasing $product_name! This is a premium, responsive landing 
page template designed for professional use.

--------------------------------------------------------------------------------
FILE INCLUDED
--------------------------------------------------------------------------------
- $html_file (Main landing page)

--------------------------------------------------------------------------------
INSTALLATION
--------------------------------------------------------------------------------
1. Extract the ZIP file to your desired location

2. Open $html_file in any modern web browser to view the template

3. To customize:
   - Open $html_file in a code editor (VS Code, Sublime Text, etc.)
   - Find the CSS section (embedded in <style> tags) to modify styling
   - Find the HTML content sections to modify text
   - Find the JavaScript section (embedded in <script> tags) for interactions

--------------------------------------------------------------------------------
BROWSER COMPATIBILITY
--------------------------------------------------------------------------------
This template has been tested and works correctly on:
- Google Chrome (latest)
- Mozilla Firefox (latest)
- Safari (latest)
- Microsoft Edge (latest)
- Opera (latest)

--------------------------------------------------------------------------------
FEATURES
--------------------------------------------------------------------------------
- Fully responsive design
- Modern Bootstrap 5 framework
- Clean, semantic HTML5
- CSS3 animations
- Smooth scroll navigation
- Mobile-friendly navigation
- Cross-browser compatible
- SEO optimized structure
- Easy to customize

--------------------------------------------------------------------------------
CUSTOMIZATION
--------------------------------------------------------------------------------
Colors:
Search for CSS variables or color values in the <style> section to modify 
the color scheme.

Fonts:
Google Fonts are loaded from CDN. Modify the Google Fonts link to use 
different fonts.

Images:
Replace placeholder image URLs with your own images. Images are loaded from:
- Unsplash (placeholder images)
- Font Awesome (icons)

Content:
Modify all text content directly in the HTML file. Each section is clearly 
commented and organized.

--------------------------------------------------------------------------------
SUPPORT
--------------------------------------------------------------------------------
For questions or support, please contact the author through ThemeForest.

--------------------------------------------------------------------------------
CREDITS
--------------------------------------------------------------------------------
- Bootstrap 5: https://getbootstrap.com/
- Google Fonts: https://fonts.google.com/
- Font Awesome: https://fontawesome.com/
- Unsplash (placeholder images): https://unsplash.com/

--------------------------------------------------------------------------------
LICENSE
--------------------------------------------------------------------------------
This template is sold with a Regular License from ThemeForest.

You may use this template for:
- Personal projects
- Commercial projects
- Client projects

You may NOT:
- Resell or redistribute
- Claim as your own work
- Use in illegal or unethical projects

See LICENSE.txt for full terms.

================================================================================
Thank you for your purchase!
================================================================================
EOF
}

# Create LICENSE.txt template
create_license() {
    cat > LICENSE.txt << 'EOF'
================================================================================
LICENSE AGREEMENT
================================================================================

This template is licensed under the ThemeForest Standard License.

TERMS OF USE:

PERMITTED:
- Use in personal and commercial projects
- Use in client projects
- Modify and customize to your needs
- Create end products for sale (with license purchase)

NOT PERMITTED:
- Resell or redistribute this template
- Share or distribute to others
- Use in illegal, immoral, or unethical projects
- Claim this work as your own
- Sub-license or assign rights

LIMITATIONS:
- No warranty provided
- Use at your own risk
- Author not responsible for any damages

PURCHASE REQUIREMENT:
Each project using this template requires a separate license purchase.

For the full license terms, visit:
https://themeforest.net/licenses/standard

================================================================================
EOF
}

# Process each product
for product in "${PRODUCTS[@]}"; do
    IFS=':' read -r dir_name html_file product_name <<< "$product"
    
    echo "Processing: $product_name"
    echo "  - Source: $SOURCE_DIR/$html_file"
    echo "  - Target: $OUTPUT_DIR/$dir_name/"
    
    # Create temporary directory
    temp_dir="$OUTPUT_DIR/$dir_name"
    mkdir -p "$temp_dir"
    
    # Copy HTML file
    cp "$SOURCE_DIR/$html_file" "$temp_dir/"
    
    # Create README.txt
    cd "$temp_dir"
    create_readme "$product_name" "$dir_name" "$html_file"
    
    # Create LICENSE.txt
    create_license
    
    # Create ZIP file
    cd "$OUTPUT_DIR"
    zip -r "${dir_name}.zip" "$dir_name"
    
    echo "  - Created: $OUTPUT_DIR/${dir_name}.zip"
    echo ""
done

echo "=========================================="
echo "Package Creation Complete!"
echo "=========================================="
echo ""
echo "ZIP files created in: $OUTPUT_DIR"
echo ""

# List created files
echo "Created packages:"
ls -lh "$OUTPUT_DIR"/*.zip 2>/dev/null || echo "No ZIP files found"

echo ""
echo "Next Steps:"
echo "1. Review each ZIP file's contents"
echo "2. Submit packages to ThemeForest"
echo "3. Use metadata.json for submission details"
echo "4. Use description.txt for item description"
echo "5. Use tags.txt for SEO tags"
