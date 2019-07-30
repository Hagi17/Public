/**
 * @description contains jsObject (for manipulating objects), jsTest (for testing variables),
 * and prototypes
 * @author Clemens Hagenbuchner <hagenbuchner@student.tugraz.at>
 * @module Prototypes
 * @requires jQuery (jsObject.deepclone)
 */

class jsObject {
    /**
     * für alle Attribute eines Objektes die übergebene Funktion ausführen
     *
     * @param {*} obj das zugrundeliegende Objekt
     * @param {function} event die auszuführende Funktion (attribut, attribut-name, objekt)
     */
    static forEachProperty(obj, event) {
        for (var property in obj) {
            if (obj.hasOwnProperty(property)) {
                event(obj[property], property, obj);
            }
        }
    }

    /**
     * calls the given function on each object in the Array
     * @param {array} array array on which to call the functions
     * @param {function} call function to be called on each item
     */
    static withEach(array, call) {
        if (array === null) return;
        if (array.constructor === Array) {
            if (array.length > 0) {
                array.forEach(call);
            }
        } else {
            call(array);
        }
    }

    /**
     * Clones an object, by assigning each property to a new object
     * (doesn't deep clone!)
     * @param {*} obj Object to be copied
     * @returns {*} new Object
     */
    static shallowClone(obj) {
        return Object.assign({}, obj);
    }

    /**
     * DeepClones an object, by assigning each property to a new object
     * @param {*} obj Object to be copied
     * @returns {*} new Object
     * @requires jQuery
     */
    static deepClone(obj) {
        return jQuery.extend(true, {}, obj);
    }

    /**
     * Merges the given object, values from mainObj will be favorised
     * @param {*} mainObj Primary Object
     * @param {*} newObj Secondary Object, from which to take the new properties
     * @param {*} defaultObj Default Object, for default values
     * @requires jQuery
     */
    static merge(mainObj, newObj, defaultObj) {
        return jQuery.extend(true, {}, defaultObj, newObj, mainObj);
    }
}

/**
 * Weitere Funktionen zum Prüfen von Variablen
 */
class jsTest {
    /**
     *  prüft ob die Variable definiert und auf den gegebenen Wert gesetzt ist
     *
     * @param {*} test zu testende Variable
     * @param {*=} value zu vergleichender Wert (optional, falls nicht gegeben wird gegen true verglichen)
     */
    static isSet(test, value) {
        try {
            return jsTest.isDef(test) ? jsTest.isDef(value) ? test === value : test === true : false;
        } catch (e) { return false; }
    }

    /**
     *  prüft ob die Variable definiert und eine Funktion ist
     * @param {*} test zu testende Variable
     */
    static isFunction(test) {
        try {
            return (jsTest.isDef(test) && test.constructor === Function)
        } catch (e) { return false; }
    }

    /**
     *  prüft ob die Variable definiert und eine Zahl ist
     * @param {*} test zu testende Variable
     */
    static isNumber(test) {
        try {
            return (jsTest.isDef(test) && test.constructor === Number)
        } catch (e) { return false; }
    }

    static isNumberArray(test) {
        try {
            if (!jsTest.isFilledArray(test)) return false;
            return test.all(item => jsTest.isNumber(item));
        } catch (e) { return false; }
    }

    /**
     *  prüft ob die Variable definiert und eine Zahl darstellt (kann auch String sein)
     * @param {*} test zu testende Variable
     */
    static isNumerical(test) {
        try {
            if (jsTest.isString(test)) {
                var match = test.match(/\d+(\\.\d*)?/);
                if (match != null && match.length > 0) return true;
            }
            if (jsTest.isNumber(test)) return true;
            return false;
        } catch (e) { return false; }
    }

    /**
     *  prüft ob die Variable definiert ist
     * @param {*} test zu testende Variable
     */
    static isDef(test) {
            try {
                return (typeof test !== 'undefined' && test !== null && test !== undefined);
            } catch (e) { return false; }
        }
        /**
         * retouniert das Test-Objekt wenn dieses definiert ist, ansonsten den Default-Wert
         *
         * @param {*} test Test-Objekt
         * @param {*} default_value Default-Wert
         * @returns
         */
    static use(test, default_value) {
        return jsTest.isDef(test) ? test : default_value;
    }

    /**
     *  prüft ob die Variable definiert und ein String ist
     * @param {*} test zu testende Variable
     */
    static isString(test) {
            try {
                return (jsTest.isDef(test) && (test.constructor === String || typeof test === 'string'))
            } catch (e) { return false; }
        }
        /**
         *  prüft ob die Variable definiert und ein String ist (nicht leer)
         * @param {*} test zu testende Variable
         */
    static isFilledString(test) {
        return (jsTest.isString(test) && test.length > 0);
    }

    /**
     *  prüft ob die Variable definiert und ein Array ist
     * @param {*} test zu testende Variable
     */
    static isArray(test) {
            try {
                return (jsTest.isDef(test) && test.constructor === Array)
            } catch (e) { return false; }
        }
        /**
         *  prüft ob die Variable definiert und ein Array ist (befüllt)
         * @param {*} test zu testende Variable
         */
    static isFilledArray(test) {
        return (jsTest.isArray(test) && test.length > 0);
    }
};

/**
 * escape ä/ü/ö/... in a string
 */
String.prototype.escapeCharacters = function() {
    return this.replace(/[ä\u00E4]/g, '&auml;').replace(/[ü\u00FC]/g, '&uuml;')
        .replace(/[ö\u00F6]/g, '&ouml;').replace(/[Ä\u00C4]/g, '&Auml;')
        .replace(/[Ü\u00DC]/g, '&Uuml;').replace(/[Ö\u00D6]/g, '&Ouml;')
        .replace(/[ß\u00DF]/g, '&szlig;').replace(/ü/g, '&uuml;');
}

/**
 * capitalize string
 */
String.prototype.capitalize = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

/**
 * check if the string contains the text element
 * @param {string} text The text to check if it is contained
 * @returns {boolean} True if it is included
 */
String.prototype.contains = function(text) {
    if (typeof this.includes !== 'undefined') return this.includes(text);
    return this.indexOf(text) > -1;
}

/**
 * splits the string and parses each part as a float
 * @param {string} seperator The seperator for splitting the string
 * @returns {number[]} parsed Numbers
 */
String.prototype.splitNumbers = function(seperator) {
    return this.split(seperator).toFloat();
}


/**
 * entfernt alle nicht definierten Elemente aus dem Array
 *
 * @param {array} array Input-Array (wird nicht verändert)
 */
Array.prototype.clearNullElements = function() {
    //function clearNullElements(array) {
    var newAry = [];
    this.forEach(function(elem) {
        if (elem !== null && typeof(elem) !== 'undefined')
            newAry.push(elem);
    });
    return newAry;
}

/**
 * gibt das größte Element aus dem Array zurück
 * @param {array} array Input Array
 */
Array.prototype.max = function() {
    return Math.max.apply(null, this);
}

/**
 * gibt das kleinste Element aus dem Array zurück
 * @param {array} array Input Array
 */
Array.prototype.min = function() {
    return Math.min.apply(null, this);
}

/**
 * sicherer Zugriff auf ein Array
 * @param {number} index Index im Array
 */
Array.prototype.tryget = function(index) {
    try {
        if (this.length > index && index >= 0) return this[index];
        else return null;
    } catch (err) {
        return null;
    }
}

/**
 * entfernt alle doppelten Einträge aus dem Array
 *
 * @param {array} array altes Array (wird nicht verändert)
 * @requires jQuery
 * @returns neues gefiltertes Array
 */
Array.prototype.unique = function() {
    try {
        var result = [];
        // alle Elemente durchgehen, wenn ein Eintrag noch nicht im Array ist,
        // zum neuen hinzufügen
        this.forEach(function(elem) {
            if (jQuery.inArray(elem, result) == -1 && elem !== null) {
                result.push(elem);
            }
        });
        return result;
    } catch (err) {
        console.error(err);
        return [];
    }
}

/**
 * führt für alle Einträge eine Funktion aus, wobei doppelte Einträge ignoriert werden
 *
 * @param {array} array altes Array (wird nicht verändert)
 * @param {function} call Funktion, welches für jeden Eintrag einmal aufgerufen wird
 * @requires jQuery
 * @returns neues gefiltertes Array
 */
Array.prototype.forEachUnique = function(call) {
    try {
        var result = [];
        // alle Elemente durchgehen, wenn ein Eintrag noch nicht im Array ist,
        // zum neuen hinzufügen
        this.forEach(function(elem) {
            if (jQuery.inArray(elem, result) == -1 && elem !== null) {
                result.push(elem);
                call(elem);
            }
        });
        return result;
    } catch (err) {
        console.error(err);
        return [];
    }
}

/**
 * erweitert das Array in dem jeder Eintrag mit dem Wert von part kombiniert dem
 * Array hinzugefügt wird.
 * Zusätzlich wird ein neuer Eintrag mit dem Wert von part angelegt
 *
 * @param {string[]} array anzupassendes Array (wird nicht verändert)
 * @param {string} part der Anhang zu jedem Eintrag
 * @param {string} seperator Zeichenfolge die zwischen den alten Eintrag und dem Anhang
 * eingefügt wird.
 */
Array.prototype.expandBy = function(part, seperator) {
    try {
        var newA = this.slice(); // erzeugt Kopie des Arrays.
        this.forEach(function(elem) {
            newA.push(elem + seperator + part);
        });
        newA.push(part);
        return newA;
    } catch (err) {
        return [];
    }
}

/**
 * erweitert das Array in dem an jeden Eintrag der Wert von part angehängt wird
 * zusätzlich wird ein neuer Eintrag mit dem Wert von part angelegt
 *
 * @param {string[]} array die ursprünglichen Einträge (wird nicht verändert)
 * @param {string} part der Anhang für jeden Eintrag
 * @param {string} seperator Zeichenfolge die zwischen den alten Eintrag und dem Anhang
 * eingefügt wird.
 */
Array.prototype.extendWith = function(part, seperator) {
    try {
        var newA = [];
        this.forEach(function(elem) {
            newA.push(elem + seperator + part);
        });
        newA.push(part);
        return newA;
    } catch (err) {
        console.error(err);
        return [];
    }
}

/**
 * gibt alle Einträge aus dem Array zurück, welche die Bedingung erfüllen
 * @param {function} testfunction Funktion zum Prüfen des Eintrags (elem => bool)
 * Use .filter
 */
Array.prototype.where = function(testfunction) {
        if (typeof(this.filter) !== 'undefined')
            return this.filter(testfunction);
        try {
            var newA = [];
            this.forEach(function(elem) {
                if (testfunction(elem)) newA.push(elem);
            });
            return newA;
        } catch (err) {
            console.error(err);
            return [];
        }
    }
    /**
     * projiziert alle Einträge in ein neues Format und gibt das neue Array zurück
     * @param {function} convert Funktion zum projizieren der Einträge (elem => newelem)
     */
Array.prototype.select = function(convert) {
        try {
            var newA = [];
            this.forEach(function(elem) {
                try {
                    newA.push(convert(elem));
                } catch (err) { console.error(err); }
            });
            return newA;
        } catch (err) {
            console.error(err);
            return [];
        }
    }
    /**
     * projiziert alle Einträge in ein neues Format (integer) und gibt das neue Array zurück
     */
Array.prototype.toInt = function() {
        return this.select(parseInt);
    }
    /**
     * projiziert alle Einträge in ein neues Format (float) und gibt das neue Array zurück
     */
Array.prototype.toFloat = function() {
        return this.select(parseFloat);
    }
    /**
     * projiziert alle Einträge, die die Bedingung erfüllen in ein neues Format und gibt das neue Array zurück
     * @param {function} testfunction Funktion zum Überprüfen, ob Bedingung erfüllt
     * @param {function} convert Funktion zum projizieren der Einträge (elem => newelem)
     */
Array.prototype.selectwhere = function(testfunction, convert) {
        try {
            var newA = [];
            this.forEach(function(elem) {
                if (testfunction(elem)) newA.push(convert(elem));
            });
            return newA;
        } catch (err) {
            console.error(err);
            return [];
        }
    }
    /**
     * führt für jedes Element die übergebene Funktion aus und gibt das Gesamtergebnis zurück
     * @param {*} seed Startwert
     * @param {function} method Funktion zum Erzeugen des neuen Ergebnisses (elem, old => new)
     */
Array.prototype.aggregate = function(seed, method) {
    try {
        var obj = seed;
        this.forEach(function(elem) {
            obj = method(elem, obj);
        });
        return obj;
    } catch (err) {
        console.error(err);
        return seed;
    }
}

/**
 * fügt ein Objekt hinzu oder entfernt es aus dem Array
 * @param {array} array Array, zu welchem das Element hinzugefügt oder aus welchem es entfernt werden soll
 *  (wird nicht verÃ¤ndert)
 * @param {*} obj hinzu zufügendes oder zu entfernendes Objekt
 * @param {function} compare Funktion zum ermitteln ob das Objekt einem Array-Element entspricht
 * @param {boolean} all falls obj ein Array ist, wird bei all = true, werden alle Layer entweder hinzugefügt oder entfernt
 */
Array.prototype.compareXChange = function(obj, compare, all) {
    if (obj === null || typeof(obj) === 'undefined')
        return this.slice();
    if (obj.constructor === Array) {
        var newArr = [];
        this.forEach(function(elem) {
            for (var i = 0; i < obj.length; i++) {
                if (compare(elem, obj[i])) {
                    if (all) obj = [];
                    else obj.splice(i, 1);
                    return;
                }
            }
            newArr.push(elem);
        });
        newArr = newArr.concat(obj);
    } else {
        var found = false;
        this.forEach(function(elem) {
            if (!compare(elem, obj)) newArr.push(elem);
            else found = true;
        });
        if (!found) newArr.push(obj);
    }
    return newArr;
}

/**
 * fügt ein Objekt hinzu sofern es nicht bereits vorhanden ist
 * @param {array} array Array, zu welchem das Element hinzugefügt werden soll
 *  (wird nicht verÃ¤ndert)
 * @param {*} obj hinzu zufügendes Objekt
 * @param {function} compare Funktion zum ermitteln ob das Objekt einem Array-Element entspricht
 */
Array.prototype.pushOnce = function(obj, compare) {
    if (obj === null || typeof(obj) === 'undefined')
        return this.slice();
    var newArr = this.slice();
    if (obj.constructor === Array) {
        this.forEach(function(elem) {
            for (var i = 0; i < obj.length; i++) {
                if (compare(elem, obj[i]))
                    obj.splice(i, 1);
            }
        });
        return newArr.concat(obj);
    } else {
        var found = false;
        this.forEach(function(elem) {
            if (compare(elem, obj)) found = true;
        });
        if (!found) newArr.push(obj);
        return newArr;
    }
}


/**
 * fügt ein LayerElement hinzu oder entfernt es aus dem Array (Vergleich aufgrund property ol_uid)
 * @param {*} obj Layer welcher hinzugefügt oder entfernt werden soll
 * @param {boolean} all falls obj ein Array ist, wird bei all = true, werden alle Layer entweder hinzugefügt oder entfernt
 */
Array.prototype.layerXChange = function(obj, all) {
    return this.compareXChange(obj, function(elemIn, elemComp) { return (elemIn.ol_uid === elemComp.ol_uid); }, all);
}

/**
 * fügt ein LayerElement hinzu (sofern nicht bereits vorhanden) (Vergleich aufgrund property ol_uid)
 * @param {*} obj Layer welche hinzugefügt werden sollen
 */
Array.prototype.pushLayer = function(obj) {
    if (obj !== null && obj.constructor === Array) {
        var ary = this;
        obj.forEach(function(elem) {
            ary = ary.pushOnce(elem);
        });
        return ary;
    }
    return this.pushOnce(obj, function(elemIn, elemComp) { return (elemIn.ol_uid === elemComp.ol_uid); });
}

/**
 * prüft ob alle Elemente die Bedingung erfüllen
 * @param {function} test Bedingung, welche erfüllt werden soll
 */
Array.prototype.all = function(test) {
    for (var i = 0; i < this.length; i++)
        if (!test(this[i])) return false;
    return true;
}

/**
 * prüft ob zumindest ein Element die Bedingung erfüllt
 * @param {function} test Bedingung, welche erfüllt werden soll
 */
Array.prototype.any = function(test) {
    for (var i = 0; i < this.length; i++)
        if (test(this[i])) return true;
    return false;
}

// Mathematical prototypes

/**
 * calculates the sum of all elements in the array (requires numerical array)
 * @returns {number} sum
 */
Array.prototype.sum = function() {
        return this.aggregate(0, (item, sum) => (sum + item));
    }
    /**
     * calculates the euclidian norm of the array
     * @returns {number} norm of array
     */
Array.prototype.norm = function() {
        return Math.sqrt(this.aggregate(0, (item, sum) => sum + (item * item)));
    }
    /**
     * calculates the difference between the two arrays
     * @param {number[]} array subtractor
     * @returns {number[]} difference array
     */
Array.prototype.difference = function(array) {
        if (this.length != array.length) throw new Error('different array lengths');
        var ary = this.slice();
        for (var i = 0; i < ary.length; i++)
            ary[i] -= array[i];
        return ary;
    }
    /**
     * calculates the distance (= norm of difference) between the two arrays
     * @param {number[]} array subtractor
     * @returns {number} distance
     */
Array.prototype.distance = function(array) {
    if (this.length != array.length) throw new Error('different array lengths');
    var sum = 0;
    for (var i = 0; i < this.length; i++)
        sum += (this[i] - array[i]) * (this[i] - array[i]);
    return Math.sqrt(sum);
}

/**
 * Zahl in Buchstaben umwandeln 0->A,...25->Z, 26->AA, 51->AZ
 *
 * @param {number} nr Zahl
 * @returns {string} Buchstabenkette
 */
Number.prototype.nrToChar = function() {
    var nr = this;
    var output = '';
    var first = true;
    do {
        var charNr = nr % 26;
        if (!first) charNr--;
        else first = false;
        nr = Math.floor(nr / 26);
        output = String.fromCharCode(65 + charNr) + output;
    } while (nr > 0);
    return output;
}



/**
 * formatiert das Datum,
 * verfügbare Variablen: yyyy (4-stelliges Jahr), yy (2-stelliges Jahr), MM (Monat)
 * dd (Tag), hh (Stunde), mm (Minute), ss (Sekunde)
 * @param {string} format Datumsformat
 */
Date.prototype.format = function(format) {
    format = format || "yyyy-MM-dd hh:mm:ss";
    var year = (this.getFullYear().toString()).substring(2);
    var month = (this.getMonth() + 1).toString().padStart(2, '0');
    var day = (this.getDate()).toString().padStart(2, '0');
    var hour = (this.getHours()).toString().padStart(2, '0');
    var min = (this.getMinutes()).toString().padStart(2, '0');
    var sec = (this.getSeconds()).toString().padStart(2, '0');

    return format.replace(/yyyy/g, this.getFullYear())
        .replace(/MM/g, month).replace(/dd/g, day)
        .replace(/yy/g, year).replace(/mm/g, min)
        .replace(/ss/g, sec).replace(/hh/g, hour);
}

/**
 * ermittelt die Position des Events (für Touch und Maus)
 */
Event.prototype.Position = function() {
    if (this.pageX)
        return { x: this.pageX, y: this.pageY };
    if (this.targetTouches && this.targetTouches.length > 0 && this.targetTouches[0].pageX)
        return {
            x: this.targetTouches[0].pageX,
            y: this.targetTouches[0].pageY
        };
    if (this.changedTouches && this.changedTouches.length > 0 && this.changedTouches[0].pageX)
        return {
            x: this.changedTouches[0].pageX,
            y: this.changedTouches[0].pageY
        };
    if (this.clientX)
        return { x: this.clientX, y: this.clientY };
}