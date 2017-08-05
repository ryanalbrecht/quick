component extends="tests.resources.ModuleIntegrationSpec" appMapping="/app" {

    function run() {
        describe( "Base Entity Metadata Spec", function() {
            it( "extends from the Base Entity", function() {
                var user = getInstance( "User" );
                var md = getMetadata( user );
                expect( md ).toHaveKey( "extends" );
                expect( md.extends ).toHaveKey( "name" );
                expect( md.extends.name ).toBe( "quick.models.BaseEntity" );
            } );

            describe( "full name", function() {
                it( "calculates the full name from the metadata", function() {
                    var post = getInstance( "User" );
                    expect( post.getFullName() ).toBe( "app.models.User" );
                } );
            } );

            describe( "entity name", function() {
                it( "determines the entity name from the metadata if an `entityname` attribute is present", function() {
                    var post = getInstance( "Post" );
                    expect( post.getEntityName() ).toBe( "MyPost" );
                } );

                it( "calculates the entity name from the file name if no `entityname` attribute is present", function() {
                    var post = getInstance( "User" );
                    expect( post.getEntityName() ).toBe( "User" );
                } );
            } );

            describe( "table name", function() {
                it( "determines the table name from the metadata if a `table` attribute is present", function() {
                    var post = getInstance( "Post" );
                    expect( post.getTable() ).toBe( "my_posts" );
                } );

                it( "calculates the table name from the entity name if no `table` attribute is present", function() {
                    var post = getInstance( "User" );
                    expect( post.getTable() ).toBe( "users" );
                } );

                it( "uses the snake case plural version of the component name", function() {
                    var post = getInstance( "BankAccount" );
                    expect( post.getTable() ).toBe( "bank_accounts" );
                } );
            } );

            describe( "primary key", function() {
                it( "uses the `variables.key` value if set", function() {
                    var post = getInstance( "Post" );
                    expect( post.getKey() ).toBe( "post_pk" );
                } );

                it( "uses the `id` as the `variables.key` value by default", function() {
                    var user = getInstance( "User" );
                    expect( user.getKey() ).toBe( "id" );
                } );
            } );

            describe( "attributecasing", function() {
                it( "defaults to the module setting `defaultAttributeCasing`", function() {
                    var post = getInstance( "Post" );
                    expect( post.getAttributeCasing() ).toBe( "none" );
                } );

                it( "determines the attribute casing from the metadata if an `attributecasing` attribute is present", function() {
                    var user = getInstance( "User" );
                    expect( user.getAttributeCasing() ).toBe( "snake" );
                } );
            } );
        } );
    }

}