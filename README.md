# lens-composer

Process a `composer-requires/` tree and/or `composer.json` file to project PHP classes and bootstraps into an emergence runtime tree.

## Debugging

1. Create a build of the lens:

    ```bash
    HAB_ORIGIN=holo build /src/lens-composer
    ```

2. Symlink built package to working tree sources:

    ```bash
    hab pkg binlink core/node
    cd /src/lens-composer
    npm install
    ln -sf /src/lens-composer/lens-tree $(hab pkg path holo/lens-composer)/bin/lens-tree
    rm -rf $(hab pkg path holo/lens-composer)/node_modules
    ln -sf /src/lens-composer/node_modules $(hab pkg path holo/lens-composer)/node_modules
    ```

3. Edit shebang line in [`lens-tree`](./lens-tree) to enable node debugger:

    ```bash
    #!/bin/node --inspect-brk=0.0.0.0
    ```

4. Launch `attach to lens-composer` debugger task
5. Execute projection on a holobranch using the lens within a studio:

    ```bash
    git holo project emergence-site --working --debug
    ```
