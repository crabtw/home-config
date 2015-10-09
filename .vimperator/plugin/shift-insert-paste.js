(function() {
    function pasteClipboard() {
        if (liberator.has("Windows")) {
            this.executeCommand("cmd_paste");
            return;
        }

        // FIXME: #93 (<s-insert> in the bottom of a long textarea bounces up)
        let elem = liberator.focus;

        if (elem.setSelectionRange && util.readFromClipboard()) {
            // readFromClipboard would return 'undefined' if not checked
            // dunno about .setSelectionRange
            // This is a hacky fix - but it works.
            let curTop = elem.scrollTop;
            let curLeft = elem.scrollLeft;

            let rangeStart = elem.selectionStart; // caret position
            let rangeEnd = elem.selectionEnd;
            let tempStr1 = elem.value.substring(0, rangeStart);
            let tempStr2 = util.readFromClipboard();
            let tempStr3 = elem.value.substring(rangeEnd);
            elem.value = tempStr1 + tempStr2 + tempStr3;
            elem.selectionStart = rangeStart + tempStr2.length;
            elem.selectionEnd = elem.selectionStart;

            elem.scrollTop = curTop;
            elem.scrollLeft = curLeft;
        }
    }

    mappings.add([modes.INSERT, modes.COMMAND_LINE],
        ["<S-Insert>"], "Insert clipboard/selection",
        function () { pasteClipboard(); });
})();
