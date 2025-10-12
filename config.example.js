// Supabase Configuration Template
// Copy this file to config.js and replace with your actual values

const CONFIG = {
    SUPABASE_URL: 'your_supabase_project_url_here',
    SUPABASE_ANON_KEY: 'your_supabase_anon_key_here'
};

// Example:
// SUPABASE_URL: 'https://yourproject.supabase.co',
// SUPABASE_ANON_KEY: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = CONFIG;
}
